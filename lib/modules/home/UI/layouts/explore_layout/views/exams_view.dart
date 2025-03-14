import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/loading_state_widget.dart';
import '../view_model/exam/exam_cubit.dart';

class ExamsView extends StatefulWidget {
  const ExamsView({
    super.key,
    required this.subjectEntity,
  });

  final SubjectEntity subjectEntity;

  @override
  State<ExamsView> createState() => _ExamsViewState();
}

class _ExamsViewState extends BaseStatefulWidgetState<ExamsView> {
  var cubit = getIt.get<ExamCubit>();

  @override
  void initState() {
    cubit.doIntent(
      GetAllExamsIntent(
        subjectId: widget.subjectEntity.id!,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.subjectEntity.name ?? '',
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<ExamCubit, ExamState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingStateWidget();
            } else if (state.isError) {
              return ErrorStateWidget(error: state.error!);
            } else if (state.isSuccess) {
              if (state.exams!.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'No Exams Found',
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Icon(
                        Icons.playlist_remove_outlined,
                        size: 60,
                        color: AppColors.blue,
                      )
                    ],
                  ),
                );
              }
              return Padding(
                padding: REdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DefinedRoutes.examDetails,
                        arguments: state.exams?[index],
                          );
                        },
                        child: buildExamCard(
                          state.exams?[index],
                        ),
                      ),
                  itemCount: state.exams?.length,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget buildExamCard(ExamEntity? entity) => Container(
        margin: REdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 0), // Shadow offset
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: REdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 24,
              ),
              child: Image.asset(
                AppStrings.examIcon,
                height: 71.h,
                width: 60.h,
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity?.title ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '${entity!.numberOfQuestions} Question' ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(children: [
                  Text(
                    'From: 1:00  To: 6:00',
                    style: theme.textTheme.bodySmall,
                  )
                ])
              ],
            ),
            const Spacer(),
            Padding(
              padding: REdgeInsets.all(16),
              child: Text(
                '${entity.duration} minutes',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
        ),
      );
}
