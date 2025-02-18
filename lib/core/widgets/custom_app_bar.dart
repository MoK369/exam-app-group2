import 'package:exam_app_group2/core/bases/base_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon;
  const CustomAppBar(
      {super.key, required this.title, this.showLeadingIcon = true});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return AppBar(
      forceMaterialTransparency: true,
      leadingWidth: 35,
      titleSpacing: 0,
      leading: !showLeadingIcon
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
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
