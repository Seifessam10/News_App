import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data/api/model/article_reponse/articles.dart';
import 'package:news_app/presention/screens/home/tabs/article_details/article_details_screen.dart';

class ArticleItem extends StatelessWidget {
  Article article;

  ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: InkWell(
        // 3ayz aro7 a7ot el route fel routes manger
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailsScreen(article: article),
              ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(article.urlToImage ?? '')),
            SizedBox(
              height: 6.h,
            ),
            Text(article.source?.name ?? '', style: AppStyle.sourceName),
            SizedBox(
              height: 4.h,
            ),
            Text(article.title ?? '', style: AppStyle.articleTitle),
            SizedBox(
              height: 4.h,
            ),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end, style: AppStyle.publishAt),
          ],
        ),
      ),
    );
  }
}
