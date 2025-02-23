import 'package:exam_app_group2/core/bases/base_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon;
  final bool popOutOfTheApp;
  CustomAppBar(
      {super.key,
      required this.title,
      this.showLeadingIcon = true,
      this.popOutOfTheApp = false});

  @override
  Widget customBuild(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leadingWidth: 35,
      titleSpacing: 0,
      leading: !showLeadingIcon
          ? SizedBox(
              width: 16.w,
            )
          : IconButton(
              onPressed: () {
                if (popOutOfTheApp) {
                  SystemNavigator.pop();
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
    );
  }

  @override
  Size get preferredSize => Size(0, 65.h);
}
