import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final TabBar? bottom;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Widget? leading;

  CustomAppBar({
    Key? key,
    this.appBarTitleText,
    this.actions,
    this.bottom,
    this.leading,
    this.isBackButtonEnabled = true,
  }) : super(key: key);

  @override
  Size get preferredSize => bottom != null ? AppBar().preferredSize * 2 :AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: false,
      elevation: 1,
      automaticallyImplyLeading: isBackButtonEnabled,
      leading: leading,
      actions: actions,
      bottom: bottom,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: appBarTitleText == null ? Image.asset('images/logo_login.png', height: 24,) : AppBarTitle(text: appBarTitleText!),
    );
  }
}
