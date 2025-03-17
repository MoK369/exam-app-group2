import 'dart:developer';

import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/result_layout/view%20model/cashed_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({super.key});

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  var cubit = getIt.get<CachedQuestionsCubit>();
  String subjectName = "";

  @override
  void initState() {
    super.initState();
    cubit.doIntent(GetCachedQuestionsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 35.sp, left: 15.sp),
          child: Text(
            "Results",
            style: AppThemes.styles20w500black15,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<CachedQuestionsCubit, CachedQuestionsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(child: Text("Error loading results"));
            } else if (state.cachedQuestions!.isEmpty) {
              return const Center(child: Text("No results available"));
            }
            log("length el cache");
            print(state.cachedQuestions!.length);
            return ListView.builder(
              itemCount: state.cachedQuestions!.length,
              itemBuilder: (context, index) {
                final subject = state.cachedQuestions![index];

                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.sp, left: 15.sp),
                        child: Text(
                          subject.subjectName ?? "Unknown Subject",
                          style: AppThemes.styles18w500black15,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, qIndex) {
                          final question = subject.questions![qIndex];
                          // print(question.exam!.numberOfQuestions);
                          // print(question.exam!.duration);
                          // print("teest");
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DefinedRoutes.examAnswers,
                                arguments: [subject.questions, subject.answers],
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 4.w),
                              child: Container(
                                height: 100.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(42, 41, 41, 0.25),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 24.w),
                                        Image.asset("assets/images/Profit.png",
                                            width: 60.sp, height: 71.sp),
                                        SizedBox(width: 16.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 16.h),
                                            Text(
                                              question.exam!.title ??
                                                  "no title",
                                              style:
                                                  AppThemes.styles16w500black15,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              question.exam!.numberOfQuestions
                                                      .toString() ??
                                                  "",
                                              style:
                                                  AppThemes.styles13w400black15,
                                            ),
                                            SizedBox(height: 12.h),
                                            Row(
                                              children: [
                                                Text(
                                                  "test ",
                                                  style: AppThemes
                                                      .styles12w500blue,
                                                ),
                                                SizedBox(width: 0.w),
                                                Text(
                                                  "test",
                                                  style: AppThemes
                                                      .styles12w600blue,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: 250.w,
                                      top: 20.h,
                                      child: Text(
                                        question.exam!.duration.toString() ??
                                            "no duration",
                                        style: AppThemes.styles13w400black15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
