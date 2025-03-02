import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/modules/home/UI/view_model/home/home_cubit.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/loading_state_widget.dart';
import '../../../authentication/domain/entities/authentication/authentication_response_entity.dart';

class HomeScreen extends StatefulWidget {
  final bool? rememberMe;
  final AuthenticationResponseEntity authEntity;

  const HomeScreen({super.key, required this.authEntity, this.rememberMe});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen>
    with WidgetsBindingObserver {
  var cubit = getIt.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.doIntent(GetAllSubjectsIntent());
    if (widget.authEntity.message != StorageConstants.storedMessage) {
      print("Logged in Successfully");
      print(widget.authEntity.user?.email ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Survey',
        padding: REdgeInsets.symmetric(
          horizontal: 16,
        ),
        textStyle: theme.textTheme.labelMedium!.copyWith(
          fontSize: 20.sp,
          color: AppTheme.blueAppColor,
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
              'Browse by subject',
              style: theme.textTheme.labelMedium,
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocProvider(
              create: (context) => cubit,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const LoadingStateWidget();
                  } else if (state.isError) {
                    return ErrorStateWidget(
                      error: state.error!,
                    );
                  } else if (state.isSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DefinedRoutes.exams,
                              arguments: state.subjects?[index],
                            );
                          },
                          child: buildSubjectCard(
                            title: state.subjects?[index].name ?? '',
                            url: state.subjects![index].icon ?? '',
                          ),
                        ),
                        itemCount: state.subjects?.length,
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
    );
  }

  Widget buildSearchBar() => TextField(
    decoration: InputDecoration(
      hintText: 'Search',
      prefixIcon: const Icon(
        Icons.search,
        color: AppTheme.grayAppColor30,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.blueAppColor,
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
          color: AppTheme.white,
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

class HomeScreenParameters {
  AuthenticationResponseEntity authEntity;
  bool rememberMe;

  HomeScreenParameters({required this.authEntity, required this.rememberMe});
}
