import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manger.dart';

class AppStyle {
  static final TextStyle appBar = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle drawerText = TextStyle(
    color: Colors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle drawerItem = TextStyle(
    color: ColorsManger.lgBlack,
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle picCategory = TextStyle(
    color: ColorsManger.darkGrey,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle categoryTitle = TextStyle(
    color: ColorsManger.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle sourceName = TextStyle(
      fontSize: 10.sp, color: Color(0xff79828B), fontWeight: FontWeight.w400);
  static final TextStyle articleTitle = TextStyle(
      fontSize: 16.sp, color: Color(0xff42505C), fontWeight: FontWeight.w400);
  static final TextStyle publishAt = TextStyle(
      fontSize: 13.sp, color: Color(0xffA3A3A3), fontWeight: FontWeight.w400);
  static final TextStyle articleContent = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w300, color: Color(0xff42505C));
  static final TextStyle urlText = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xff42505C));
}
