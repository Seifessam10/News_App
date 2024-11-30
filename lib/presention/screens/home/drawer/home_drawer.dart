import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/colors_manger.dart';

typedef OnMenuItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClicked onMenuItemClicked;

  HomeDrawer({super.key, required this.onMenuItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 110.h,
              color: ColorsManger.green,
              child: Text(
                'News App!',
                style: AppStyle.drawerText,
              )),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.categories);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text('Categories', style: AppStyle.drawerItem)
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.settings);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text('Settings', style: AppStyle.drawerItem)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
