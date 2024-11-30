import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manger.dart';
import 'package:news_app/data_model/category_dm.dart';
import 'package:news_app/presention/screens/home/drawer/home_drawer.dart';
import 'package:news_app/presention/screens/home/tabs/article_search_delegate/article_search_delegate.dart';
import 'package:news_app/presention/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presention/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presention/screens/home/tabs/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = Categories(
      onCategoryClicked: onCategoryClicked,
    );
  }

  late Widget selectedWidget;
  String title = 'News App';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(AssetsManger.patternBg))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: NewsSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        drawer: HomeDrawer(
          onMenuItemClicked: onMenuItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onCategoryClicked(CategoryDm category) {
    selectedWidget = CategoryDetails(categoryDm: category);
    setState(() {
      title = category.title;
    });
  }

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        selectedWidget = Categories(
          onCategoryClicked: onCategoryClicked,
        );
        setState(() {
          title = 'News App';
        });
      case MenuItem.settings:
        selectedWidget = Settings();
        setState(() {
          title = 'Settings';
        });
    }
    Navigator.pop(context);
    setState(() {});
  }
}
