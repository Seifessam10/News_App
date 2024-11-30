import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manger.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/core/utils/routes_manger.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManger.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 3),(){
    // Navigator.pushReplacementNamed(context, RoutesManger.home);
    //   });

    return Stack(
      children: [
        Container(
            color: ColorsManger.white,
            child: Image.asset(
              AssetsManger.patternBg,
              width: double.infinity,
            )),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Image.asset(
                AssetsManger.splashLogo,
                width: 199.w,
                height: 208.h,
              ),
              const Spacer(),
              Image.asset(
                AssetsManger.routeLogo,
                width: 213.w,
                height: 132.h,
              ),
            ]),
      ],
    );
  }
}
