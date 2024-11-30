import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/article_reponse/Articles_response.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

class ApiManger {
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = 'e8af66b3852f4a4a8b4ad47f3def6a72';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articleEndPoint = '/v2/everything';
  static const String searchEndpoint = '/v2/everything';

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(_baseUrl, sourcesEndPoint, {
      'apiKey': _apiKey,
      'category': categoryId,
    });
    http.Response serverResponse =
        await http.get(url); // make a network request
    var json = jsonDecode(serverResponse.body); // convert from string to json
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;

    //http.get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=e8af66b3852f4a4a8b4ad47f3def6a72'));
  }

  static Future<ArticlesResponse> searchArticles(String query) async {
    Uri url =
        Uri.https(_baseUrl, searchEndpoint, {'apiKey': _apiKey, 'q': query});
    var serverResponse = await http.get(url);
    if (serverResponse.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse;
    } else {
      return ArticlesResponse(
        status: 'error',
        message: 'Failed ,${serverResponse.statusCode}',
      );
    }
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(_baseUrl, articleEndPoint, {
      'apikey': _apiKey,
      'sources': sourceId,
    });
    var serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
