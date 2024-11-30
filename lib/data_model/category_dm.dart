import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manger.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/core/utils/constant_manger.dart';
import 'package:news_app/core/utils/strings_manger.dart';

class CategoryDm {
  String backEndId;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDm(
      {required this.backEndId,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  static List<CategoryDm> getCategoriesList() => [
        CategoryDm(
            backEndId: ConstantManger.sportsBackEndId,
            title: StringsManger.sports,
            bgColor: ColorsManger.darkRed,
            imagePath: AssetsManger.sports),
        CategoryDm(
            backEndId: ConstantManger.generalBackEndId,
            title: StringsManger.general,
            bgColor: ColorsManger.darkBlue,
            imagePath: AssetsManger.general),
        CategoryDm(
            backEndId: ConstantManger.healthBackEndId,
            title: StringsManger.health,
            bgColor: ColorsManger.pink,
            imagePath: AssetsManger.health),
        CategoryDm(
            backEndId: ConstantManger.businessBackEndId,
            title: StringsManger.business,
            bgColor: ColorsManger.lgBrown,
            imagePath: AssetsManger.business),
        CategoryDm(
            backEndId: ConstantManger.entertainmentBackEndId,
            title: StringsManger.entertainment,
            bgColor: ColorsManger.lgBlue,
            imagePath: AssetsManger.entertainment),
        CategoryDm(
            backEndId: ConstantManger.scienceBackEndId,
            title: StringsManger.science,
            bgColor: ColorsManger.sun,
            imagePath: AssetsManger.science),
        CategoryDm(
            backEndId: ConstantManger.techBackEndId,
            title: StringsManger.tech,
            bgColor: ColorsManger.green,
            imagePath: AssetsManger.tech),
      ];
}
