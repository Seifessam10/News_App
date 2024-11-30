import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/utils/routes_manger.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        onGenerateRoute: RoutesManger.router,
        initialRoute: RoutesManger.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
