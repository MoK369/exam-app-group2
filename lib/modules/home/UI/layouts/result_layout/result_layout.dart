import 'dart:developer';

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/result_layout/view%20model/cashed_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({super.key});

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends BaseStatefulWidgetState<ResultLayout> {
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
      appBar: CustomAppBar(
        title: "Results",
        showLeadingIcon: false,
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<CachedQuestionsCubit, CachedQuestionsState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.success:
                var questionsList = state.cachedQuestions ?? [];
                if (questionsList.isEmpty) {
                  return Center(
                      child: Text("No results available",
                          style: theme.textTheme.labelMedium));
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Expanded(
                        child: RPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                            itemCount: state.cachedQuestions!.length,
                            itemBuilder: (context, index) {
                              final subject = state.cachedQuestions![index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.subjectName ?? "Unknown Subject",
                                    style: AppThemes.styles18w500black15,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (context, qIndex) {
                                      final question =
                                          subject.questions![qIndex];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            DefinedRoutes.examAnswers,
                                            arguments: [
                                              subject.questions,
                                              subject.answers
                                            ],
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.h, horizontal: 4.w),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  249, 249, 249, 1),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      42, 41, 41, 0.25),
                                                  blurRadius: 1,
                                                  spreadRadius: 1,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 24.w),
                                                Image.asset(
                                                    "assets/images/Profit.png",
                                                    width: 60.sp,
                                                    height: 71.sp),
                                                SizedBox(width: 16.w),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.644,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 16.h),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            question.exam
                                                                    ?.title ??
                                                                "no title",
                                                            style: AppThemes
                                                                .styles16w500black15,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          Text(
                                                            question.exam?.duration != null?
                                                            "${question.exam!.duration} minutes":
                                                             "no duration",
                                                            style: AppThemes
                                                                .styles13w400black15,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.h),
                                                      Text(
                                                        question.exam?.numberOfQuestions != null?
                                                        "${question.exam?.numberOfQuestions} Question":
                                                        "",
                                                        style: AppThemes
                                                            .styles13w400black15,
                                                      ),
                                                      SizedBox(height: 12.h),
                                                      Text(
                                                        "test test test ",
                                                        style: AppThemes
                                                            .styles12w500blue,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
              case Status.error:
                return const Center(child: Text("Error loading results"));
            }
          },
        ),
      ),
    );
  }
}
