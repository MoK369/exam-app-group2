import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/utils/app_strings.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/answers.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../../core/routing/defined_routes.dart';
import '../../../../domain/entities/question_entity.dart';
import '../view_model/questions/questions_cubit.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key, required this.examEntity});

  final ExamEntity examEntity;

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends BaseStatefulWidgetState<QuestionsView> {
  var cubit = getIt.get<QuestionsCubit>();
  late List<QuestionEntity> questionsList;
  late QuestionEntity? questionEntity;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    cubit.doIntent(GetAllQuestionsIntent(examId: widget.examEntity.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: CustomAppBar(
          title: appLocalizations.exam,
          actions: [
            Row(
              children: [
                Image.asset(
                  AppStrings.clockIcon,
                  height: 30.h,
                  width: 24.w,
                ),
                SizedBox(
                  width: 8.w,
                ),
                ValueListenableBuilder(
                  valueListenable: cubit.examTimeValueNotifier,
                  builder: (context, valueInSeconds, child) {
                    if (valueInSeconds == 0) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) {
                          whenTimerEnds();
                        },
                      );
                    }
                    return Text(
                      cubit.doIntent<String>(
                              GetMinutesSecondsTimeFormat(valueInSeconds)) ??
                          "",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: (valueInSeconds ~/ 60) < 15
                            ? AppColors.red
                            : AppColors.green,
                        fontSize: 20.sp,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: BlocConsumer<QuestionsCubit, QuestionsState>(
            listener: (context, state) {
              if (state.isEndExam) {
                cubit.doIntent(GetAnswersList());
                cubit.doIntent(SaveCashedQuestionIntent());
                Navigator.pushReplacementNamed(
                  context,
                  DefinedRoutes.examScore,
                  arguments: [
                    cubit.checkedAnswers,
                    widget.examEntity,
                    questionsList
                  ],
                );
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingStateWidget();
              } else if (state.isError) {
                return ErrorStateWidget(error: state.error!);
              } else if (state.isSuccess) {
                questionsList = state.questions ?? [];
                questionEntity = state.questions?[state.currentQuestion - 1];
                WidgetsBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    cubit.doIntent(StartTimer(widget.examEntity.duration ?? 0));
                  },
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        appLocalizations.questionOfTotalQuestions(
                            cubit.currentQuestion, state.questions!.length),
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    StepProgressIndicator(
                      totalSteps: state.questions!.length,
                      currentStep: cubit.currentQuestion,
                      size: 4.h,
                      padding: 0,
                      selectedColor: AppColors.blue,
                      unselectedColor: AppColors.black[20]!,
                      roundedEdges: Radius.circular(100.r),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      questionEntity?.question ?? '',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Expanded(
                      flex: 2,
                      child: buildChoice(question: questionEntity!),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.blue,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                              ),
                              backgroundColor: AppColors.lightBlue,
                            ),
                            onPressed: () {
                              cubit.doIntent(PreviousQuestionIntent());
                            },
                            child: Text(
                              appLocalizations.back,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                              ),
                              backgroundColor: AppColors.blue,
                            ),
                            onPressed: () {
                              if (cubit.answersMap[
                                      "${questionEntity!.id!}_${cubit.currentQuestion}"] ==
                                  null) {
                                cubit.answersMap[
                                        "${questionEntity!.id!}_${cubit.currentQuestion}"] =
                                    "A1";
                              }
                              cubit.doIntent(NextQuestionIntent());
                            },
                            child: Text(
                              appLocalizations.next,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget buildChoice({required QuestionEntity question}) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ListView.separated(
          controller: scrollController,
          itemCount: question.answers!.length,
          itemBuilder: (context, index) {
            return Material(
              child: ListTile(
                onTap: () {
                  setState(() {
                    cubit.selectedAnswerIndex = index;
                    addAnswerInAnswersMap();
                  });
                },
                titleTextStyle: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                ),
                selected: cubit.selectedAnswerIndex == index,
                title: Text(
                  question.answers?[index].answer ?? '',
                ),
                leading: Radio<int>(
                  activeColor: AppColors.blue,
                  value: index,
                  groupValue: cubit.selectedAnswerIndex,
                  onChanged: (int? value) {
                    setState(() {
                      cubit.selectedAnswerIndex = value ?? 0;
                      addAnswerInAnswersMap();
                    });
                  },
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 16.h,
          ),
        ),
      ),
    );
  }

  void addAnswerInAnswersMap() {
    if (questionEntity?.id != null) {
      cubit.answersMap["${questionEntity!.id!}_${cubit.currentQuestion}"] =
          "A${cubit.selectedAnswerIndex + 1}";
    }
  }

  void whenTimerEnds() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: SizedBox(
          height: 200.h,
          width: 290.w,
          child: Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppStrings.timeOverIcon,
                      height: 86.h,
                      width: 45.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      appLocalizations.examTimeOut,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.doIntent(GetAnswersList());
                    if ((cubit.checkedAnswers).length < questionsList.length) {
                      for (int i = 0; i < questionsList.length; i++) {
                        if (cubit.checkedAnswers
                                .elementAtOrNull(i)
                                ?.questionId !=
                            questionsList[i].id) {
                          cubit.checkedAnswers.insert(
                              i,
                              Answers(
                                  questionId: questionsList[i].id,
                                  correct: 'A'));
                        }
                      }
                      debugPrint("${cubit.checkedAnswers}");
                    }
                    cubit.doIntent(SaveCashedQuestionIntent());
                    hideAlertDialog();
                    Navigator.pushReplacementNamed(
                        context, DefinedRoutes.examScore, arguments: [
                      cubit.checkedAnswers,
                      widget.examEntity,
                      questionsList
                    ]);
                  },
                  child: Text(
                    appLocalizations.viewScore,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
