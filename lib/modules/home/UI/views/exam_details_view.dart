import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/utils/app_strings.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/defined_routes.dart';

class ExamDetailsView extends StatefulWidget {
  const ExamDetailsView({super.key, required this.examEntity});

  final ExamEntity examEntity;

  @override
  State<ExamDetailsView> createState() => _ExamDetailsViewState();
}

class _ExamDetailsViewState extends BaseStatefulWidgetState<ExamDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppStrings.examIcon,
                    height: 47,
                    width: 42,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.examEntity.title ?? '',
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        '${widget.examEntity.numberOfQuestions} Question',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: AppTheme.darkGray,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '${widget.examEntity.duration} minutes',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppTheme.blueAppColor,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppTheme.lightBlue,
                thickness: 0.5,
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DefinedRoutes.questions,
                    arguments: widget.examEntity,
                  );
                },
                child: const Text(
                  'Start',
                ),
              )
            ],
          ),
        ));
  }
}
