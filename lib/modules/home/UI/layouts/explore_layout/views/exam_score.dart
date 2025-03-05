import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../view_model/questions/questions_cubit.dart';

class ExamScore extends StatefulWidget {
  const ExamScore({super.key});

  @override
  State<ExamScore> createState() => _ExamScoreState();
}

class _ExamScoreState extends BaseStatefulWidgetState<ExamScore> {
  var cubit = getIt.get<QuestionsCubit>();

  @override
  void initState() {
    cubit.doIntent(GetAnswersList());
    cubit.doIntent(CheckQuestionIntent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.examScore,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<QuestionsCubit, QuestionsState>(
          listener: (context, state) {
            if (state.isErrorCheckQuestions) {
              displayAlertDialog(
                  showOkButton: true,
                  title: ErrorStateWidget(error: state.error!));
            }
          },
          builder: (context, state) {
            if (state.isLoadingCheckQuestions) {
              return const LoadingStateWidget();
            } else if (state.isSuccessCheckQuestions) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    appLocalizations.yourScore,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 60.r,
                        lineWidth: 6.0,
                        percent: 0.8,
                        backgroundColor: AppColors.red,
                        center: Text(
                          '${state.checkQuestionsResponseEntity?.total}%',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                        progressColor: AppColors.blue,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  appLocalizations.correct,
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: AppColors.blue,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: REdgeInsets.only(
                                    right: 18,
                                  ),
                                  width: 30.w,
                                  height: 30.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        color: AppColors.blue,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    state.checkQuestionsResponseEntity!.correct
                                        .toString(),
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      color: AppColors.blue,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  appLocalizations.inCorrect,
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: AppColors.red,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: REdgeInsets.only(
                                    right: 18,
                                  ),
                                  width: 30.w,
                                  height: 30.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        color: AppColors.red,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    state.checkQuestionsResponseEntity!.wrong
                                        .toString(),
                                    style:
                                        theme.textTheme.labelMedium?.copyWith(
                                      color: AppColors.red,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      appLocalizations.showResult,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.blue,
                      side: BorderSide(
                        color: AppColors.blue,
                        width: 1.w,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      appLocalizations.startAgain,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
