import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/localization/use_case/localization_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../di/injectable_initializer.dart';

typedef VoidFunction = void Function()?;

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  late ThemeData theme;
  late AppLocalizations appLocalizations;
  final LocalizationUseCase localizationUseCase =
      getIt.get<LocalizationUseCase>();

  late ErrorNotifier errorNotifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    appLocalizations = localizationUseCase.get(context);
    errorNotifier = Provider.of(context, listen: false);

    if (errorNotifier.errorMessage != null) {
      Future.microtask(
        () {
          if (!mounted) return;
          showAnimatedSnackBar();
        },
      );
    }
  }

  void showAnimatedSnackBar() {
    AnimatedSnackBar(
      duration: const Duration(seconds: 10),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.black[50],
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.warning,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                width: 8.r,
              ),
              Expanded(
                child: Text(
                  errorNotifier.errorMessage ?? appLocalizations.noError,
                  maxLines: 3,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        );
      },
    ).show(context);
    Future.delayed(
      const Duration(seconds: 11),
      () => errorNotifier.clearError(),
    );
  }

  void displayAlertDialog(
      {required Widget title,
      bool showOkButton = false,
      bool showConfirmButton = false,
      bool isDismissible = false,
      VoidFunction onOkButtonClick,
      VoidFunction onConfirmButtonClick}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return AlertDialog(
          title: title,
          actions: [
            if (showOkButton)
              ElevatedButton(
                  onPressed: () => onOkButtonClick == null
                      ? Navigator.pop(context)
                      : onOkButtonClick(),
                  child: Text(
                    appLocalizations.ok,
                    style: theme.textTheme.labelMedium!
                        .copyWith(color: Colors.white),
                  )),
            if (showConfirmButton)
              Center(
                child: ElevatedButton(
                    onPressed: onConfirmButtonClick,
                    child: RPadding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16),
                      child: Text(appLocalizations.confirm,
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: Colors.white)),
                    )),
              ),
          ],
        );
      },
    );
  }

  void hideAlertDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
