import 'package:exam_app_group2/core/bases/base_stateless_widget.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon;
  final bool showLocaleButton;

  /// initialize this parameter when using onChangeLocaleButtonClick()
  final String? widgetNameForErrorNotifier;
  final void Function()? onChangeLocaleButtonClick, onLeadingIconButtonClick;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final List<Widget>? actions;

  CustomAppBar({
    this.padding,
    this.textStyle,
    this.actions,
    super.key,
    required this.title,
    this.showLeadingIcon = true,
    this.showLocaleButton = false,
    this.widgetNameForErrorNotifier,
      this.onLeadingIconButtonClick,
      this.onChangeLocaleButtonClick,
  });

  @override
  Widget customBuild(BuildContext context) {
    var currentLocal = Localizations.localeOf(context);
    return AppBar(
      forceMaterialTransparency: true,
      leadingWidth: 35,
      titleSpacing: showLeadingIcon ? 0 : 16.w,
      leading: !showLeadingIcon
          ? null
          : IconButton(
              onPressed: () {
                if (onLeadingIconButtonClick != null) {
                  onLeadingIconButtonClick!();
                } else {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
              )),
      title: Text(
        title,
        style: theme.textTheme.labelMedium!.copyWith(fontSize: 20.sp),
      ),
      actions: actions ??
          (!showLocaleButton
          ? null
          : [
              TextButton(
                  onPressed: () {
                    localizationUseCase.changeLocale(
                        currentLocal.toString() == LanguagesCodes.english
                            ? LanguagesCodes.arabic
                            : LanguagesCodes.english,
                        widgetNameForErrorNotifier ?? "");
                      if (onChangeLocaleButtonClick != null) {
                        onChangeLocaleButtonClick!();
                      }
                    },
                    child: Text(
                      currentLocal.toString().toUpperCase(),
                      style: theme.textTheme.labelMedium,
                    ),
                  )
                ]),
    );
  }

  @override
  Size get preferredSize => Size(0, 65.h);
}