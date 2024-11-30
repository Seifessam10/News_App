import 'package:news_app/data/api/model/sources_response/sources.dart';

/// source : {"id":"al-jazeera-english","name":"Al Jazeera English"}
/// author : null
/// title : "Is it really a ‘natural’ disaster? | All Hail"
/// description : "Human factors contribute to how devastating the impact of weather events is."
/// url : "https://www.aljazeera.com/program/all-hail/2024/11/22/is-it-really-a-natural-disaster-all-hail"
/// urlToImage : "https://www.aljazeera.com/wp-content/uploads/2024/11/EP8-disaster-v1-1732285669.jpg?resize=1200%2C675"
/// publishedAt : "2024-11-22T15:43:47Z"
/// content : "Typhoons, floods, earthquakes these are all hazardous natural events, but to call them natural disasters wouldnt be quite accurate. It would be downplaying the host of human factors that contribute t… [+656 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
