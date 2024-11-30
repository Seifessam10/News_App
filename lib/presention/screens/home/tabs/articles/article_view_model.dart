import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/article_reponse/articles.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article>? articles;
  String? errorMessage;
  bool isLoading = false;

  void getArticlesBySourceId<Article>(String sourceId) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiManger.getArticles(sourceId);
    isLoading = false;
    try {
      if (response.status == 'ok') {
        articles = response.articles;
      } else {
        errorMessage = response.message;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
