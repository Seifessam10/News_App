import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manger/api_manger.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? errorMessage;

  bool isLoading = false;

  void getSourcesByCategoryId(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiManger.getSources(categoryId);
      isLoading = false;
      if (response.status == 'ok') {
        sources = response.sources;
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
