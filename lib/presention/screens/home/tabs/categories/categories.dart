import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/category_dm.dart';
import 'package:news_app/presention/screens/home/tabs/categories/widgets/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDm category);

class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});

  OnCategoryClicked onCategoryClicked;
  List<CategoryDm> categoriesList = CategoryDm.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Column(
        children: [
          Text('Pick your category of interest', style: AppStyle.picCategory),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 20.h,
            ),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidget(
                    categoryDm: categoriesList[index], index: index)),
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
