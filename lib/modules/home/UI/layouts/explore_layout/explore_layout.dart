import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/constants/assets/assets_paths.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/explore_layout/view_model/explore/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/widgets/loading_state_widget.dart';

class ExploreLayout extends StatefulWidget {
  const ExploreLayout({
    super.key,
  });

  @override
  State<ExploreLayout> createState() => _ExploreLayoutState();
}

class _ExploreLayoutState extends BaseStatefulWidgetState<ExploreLayout>
    with WidgetsBindingObserver {
  var cubit = getIt.get<ExploreCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doIntent(GetAllSubjectsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: appLocalizations.survey,
          padding: REdgeInsets.symmetric(
            horizontal: 16,
          ),
          textStyle: theme.textTheme.labelMedium!.copyWith(
            fontSize: 20.sp,
            color: AppColors.blue,
          ),
          showLeadingIcon: false,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildSearchBar(),
              SizedBox(
                height: 40.h,
              ),
              Text(
                appLocalizations.browseBySubject,
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(
                height: 24.h,
              ),
              BlocProvider(
                create: (context) => cubit,
                child: BlocBuilder<ExploreCubit, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Expanded(child: LoadingStateWidget());
                    } else if (state.isError) {
                      return ErrorStateWidget(
                        error: state.error!,
                      );
                    } else if (state.isSuccess) {
                      return Expanded(
                        child: state.searchStatus == SearchStatus.withoutResult
                            ? RPadding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 32),
                                child: Lottie.asset(
                                    AssetsPaths.noSearchResultAnim),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      DefinedRoutes.exams,
                                      arguments:
                                          state.userSearchedSubjects?[index],
                                    );
                                  },
                                  child: buildSubjectCard(
                                    title: state.userSearchedSubjects?[index]
                                            .name ??
                                        '',
                                    url: state.userSearchedSubjects![index]
                                            .icon ??
                                        '',
                                  ),
                                ),
                                itemCount: state.userSearchedSubjects?.length,
                              ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() => TextField(
        onChanged: (value) {
          cubit.doIntent(SearchInSubjectList(value));
        },
        decoration: InputDecoration(
          hintText: appLocalizations.search,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.gray,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
        ),
      );

  Widget buildSubjectCard({
    required String title,
    required String url,
  }) =>
      Container(
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
              child: Image.network(
                url,
                height: 50.h,
                width: 50.h,
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      );
}
