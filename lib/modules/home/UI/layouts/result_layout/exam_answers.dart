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

class _ExamAnswersState extends State<ExamAnswers> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Answers"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.questionEntities.length,
                itemBuilder: (context, index) {
                  i = index;
                  return Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Container(
                      width: 300.w,
                      height: 360.h,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.sp,
                              spreadRadius: 1.sp,
                              color: const Color.fromRGBO(42, 41, 41, 0.25),
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(12.0.sp),
                        child: Column(
                          children: [
                            Text(
                                widget.questionEntities[index].question
                                    .toString(),
                                style: AppThemes.styles18w500black15,
                                textAlign: TextAlign.left),
                            SizedBox(
                              height: 4.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    widget.questionEntities[i].answers!.length,
                                itemBuilder: (context, index) {
                                  print(
                                      "Correct Answer: ${widget.questionEntities[i].correct}");
                                  print(
                                      "Current Answer: ${widget.answers[index].correct}");
                                  print(
                                      "Comparison Result: ${widget.questionEntities[i].correct == widget.answers[i].correct}");

                                  return AnswerOption(
                                      isMultiple:
                                          widget.questionEntities[i].type !=
                                              "single_choice",
                                      isSelected:
                                          int.tryParse(widget.answers[index].correct!.substring(1)) ==
                                              index + 1,
                                      isCorrect: widget.questionEntities[i]
                                              .correct!.isNotEmpty &&
                                          widget.questionEntities[i].correct!
                                                  .substring(widget
                                                          .questionEntities[i]
                                                          .correct!
                                                          .length -
                                                      1) ==
                                              (index + 1).toString(),
                                      answerText: widget.questionEntities[i]
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
