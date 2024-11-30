import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';

class SourceItemWidget extends StatelessWidget {
  bool isSelected;
  Source source;

  SourceItemWidget({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 8),
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManger.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: ColorsManger.green),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected ? ColorsManger.white : Colors.green,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
