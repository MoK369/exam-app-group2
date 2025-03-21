import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/answer_option.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/answers.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamAnswers extends StatefulWidget {
  List<QuestionEntity> questionEntities;
  List<Answers> answers;
  ExamAnswers(
      {super.key, required this.answers, required this.questionEntities});

  @override
  State<ExamAnswers> createState() => _ExamAnswersState();
}

class _ExamAnswersState extends BaseStatefulWidgetState<ExamAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appLocalizations.answers),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.questionEntities.length,
                itemBuilder: (context, index) {
                  var currentQuestion = widget.questionEntities[index];
                  var currentQuestionUserAnswer = widget.answers[index];
                  return Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.sp,
                              spreadRadius: 1.sp,
                              color: AppColors.placeHolderColor,
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(12.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              widget.questionEntities[index].question ?? "",
                              style: AppThemes.styles18w500black15,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget
                                    .questionEntities[index].answers!.length,
                                itemBuilder: (context, index) {
                                  return AnswerOption(
                                      isMultiple: currentQuestion.type !=
                                          "single_choice",
                                      isSelected: int.tryParse(
                                              currentQuestionUserAnswer.correct
                                                      ?.substring(1) ??
                                                  "") ==
                                          index + 1,
                                      isCorrect:
                                          currentQuestion.correct!.isNotEmpty &&
                                              currentQuestion.correct!
                                                      .substring(1) ==
                                                  (index + 1).toString(),
                                      answerText: currentQuestion
                                          .answers![index].answer
                                          .toString());
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
