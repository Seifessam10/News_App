import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDm categoryDm;
  int index;

  CategoryWidget({super.key, required this.categoryDm, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDm.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
              bottomLeft: Radius.circular(index.isEven ? 25.r : 0.r),
              bottomRight: Radius.circular(index.isEven ? 0.r : 25.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            categoryDm.imagePath,
            width: 142.w,
            height: 126.h,
          ),
          Text(
            categoryDm.title,
            style: AppStyle.categoryTitle,
          )
        ],
      ),
    );
  }
}
