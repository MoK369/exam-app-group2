import 'dart:developer';

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/utils/app_strings.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
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
  int selectedIndex = 0;
  var cubit = getIt.get<QuestionsCubit>();

  @override
  void initState() {
    cubit.doIntent(GetAllQuestionsIntent(examId: widget.examEntity.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TimerCountdown(
                format: CountDownTimerFormat.minutesSeconds,
                endTime: DateTime.now().add(
                  Duration(
                    minutes: widget.examEntity.duration!.toInt(),
                  ),
                ),
                enableDescriptions: false,
                spacerWidth: 3.w,
                timeTextStyle: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.green,
                  fontSize: 20.sp,
                ),
                onEnd: () {
                  if (!cubit.isEndExam) {
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
                                      style:
                                          theme.textTheme.titleSmall?.copyWith(
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
                                    Navigator.pushReplacementNamed(
                                      context,
                                      DefinedRoutes.examScore,
                                    );
                                  },
                                  child: Text(
                                    appLocalizations.viewScore,
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
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
                },
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: Padding(
          padding: REdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: BlocConsumer<QuestionsCubit, QuestionsState>(
            listener: (context, state) {
              if (state.isEndExam) {
                // cubit.doIntent(GetAnswersList());
                // cubit.doIntent(CheckQuestionIntent());
                Navigator.pushReplacementNamed(
                  context,
                  DefinedRoutes.examScore,
                  arguments: cubit,
                );
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingStateWidget();
              } else if (state.isError) {
                return ErrorStateWidget(error: state.error!);
              } else if (state.isSuccess) {
                var question = state.questions?[cubit.currentQuestion - 1];
                cubit.answersMap[question?.id] = "A${selectedIndex + 1}";
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Question ${cubit.currentQuestion} of ${state.questions!.length}',
                          style: theme.textTheme.titleSmall,
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
                          question?.question ?? '',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        buildChoice(question: question!),
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
                                  'Back',
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
                                  cubit.doIntent(NextQuestionIntent());
                                },
                                child: Text(
                                  'Next',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    return SizedBox(
      height: 257.h,
      child: ListView.separated(
        itemCount: question.answers!.length,
        itemBuilder: (context, index) {
          return ListTile(
            titleTextStyle: theme.textTheme.bodySmall?.copyWith(
              fontSize: 14.sp,
            ),
            selected: selectedIndex == index,
            title: Text(
              question.answers?[index].answer ?? '',
            ),
            leading: Radio<int>(
              activeColor: AppColors.blue,
              value: index,
              groupValue: selectedIndex,
              onChanged: (int? value) {
                selectedIndex = value ?? 0;
                cubit.answersMap[question.id] = "A${selectedIndex + 1}";
                log(cubit.answersMap.toString());
                setState(() {});
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 16.h,
        ),
      ),
    );
  }
}
