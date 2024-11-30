import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/article_reponse/articles.dart';
import 'package:news_app/presention/screens/home/tabs/articles/article_item_widget.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: Theme.of(context).appBarTheme,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.searchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManger.green,
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        if (articles.isEmpty || articles == null) {
          return const Center(
            child: Text('No results found'),
          );
        }
        return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) => ArticleItem(
                  article: articles[index],
                ));
      },
    );
  }
}
