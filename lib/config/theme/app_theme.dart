import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/colors_manger.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    indicatorColor: ColorsManger.green,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      color: ColorsManger.green,
      centerTitle: true,
      titleTextStyle: AppStyle.appBar,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r))),
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 5,
      // scrimColor: Colors.black.withOpacity(0.6)
    ),
  );
}
