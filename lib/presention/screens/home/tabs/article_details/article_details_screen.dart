import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data/api/model/article_reponse/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  Article article;

  ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(article.title ?? 'No title'),
        titleTextStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400),
      ),
      body: Padding(
        padding: REdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 5.h),
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(article.urlToImage ?? '')),
            SizedBox(height: 10.h),
            Text(article.source?.name ?? '', style: AppStyle.sourceName),
            SizedBox(height: 10.h),
            Text(
              article.title ?? '',
              style: AppStyle.articleTitle,
            ),
            SizedBox(height: 10.h),
            Text(
              article.publishedAt ?? '',
              textAlign: TextAlign.end,
              style: AppStyle.publishAt,
            ),
            SizedBox(height: 15.h),
            Container(
              padding: REdgeInsets.all(10),
              margin: REdgeInsets.all(10),
              child:
                  Text(article.content ?? '', style: AppStyle.articleContent),
            ),
            const Spacer(),
            InkWell(
              onTap: () => urlLauncher(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Full Article',
                    style: AppStyle.urlText,
                  ),
                  const Icon(Icons.arrow_circle_right_outlined),
                  // I will make all the row clickable  and put the function in the on tap InkWell
                  // so when user click the Text or the icon go to the site

                  // IconButton(
                  //     onPressed: ()  {
                  //       // Uri url = Uri.parse(article.url ?? '');
                  //       // if(await canLaunchUrl(url)){
                  //       //   await launchUrl(url);
                  //       // }
                  //       urlLauncher();
                  //     }
                  //     , icon: const Icon(Icons.arrow_circle_right_outlined)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void urlLauncher() async {
    if (article.url != null && article.url!.isNotEmpty) {
      Uri url = Uri.parse(article.url!);
      if (await canLaunchUrl(url)) {
        launchUrl(url);
      } else {
        print('invalid url');
      }
    }
  }
}
