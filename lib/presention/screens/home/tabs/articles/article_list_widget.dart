import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/data/api/model/article_reponse/articles.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/presention/screens/home/tabs/articles/article_item_widget.dart';
import 'package:news_app/presention/screens/home/tabs/articles/article_view_model.dart';
import 'package:provider/provider.dart';

class ArticleListWidget extends StatefulWidget {
  Source source;

  ArticleListWidget({super.key, required this.source});

  @override
  State<ArticleListWidget> createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  var viewModel = ArticleViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.getArticlesBySourceId(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant ArticleListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<ArticleViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsManger.green,
              ));
            }
            if (viewModel.errorMessage != null) {
              return Text(viewModel.errorMessage!);
            }
            List<Article> articles = viewModel.articles!;
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleItem(article: articles[index]),
                itemCount: articles.length,
              ),
            );
          },
        ));

    // return FutureBuilder(
    //     future: ApiManger.getArticles(source.id!),
    //     builder: (context, snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return const Center(child:  CircularProgressIndicator(color: ColorsManger.green,),);
    //       }
    //       if(snapshot.data?.status == 'error' || snapshot.hasError){
    //         return Text(snapshot.data?.message ?? 'Check internet connection');
    //       }
    //       List<Article> articles = snapshot.data!.articles!;
    //       return Expanded(
    //         child: ListView.builder(
    //           itemBuilder: (context, index) => ArticleItem(article: articles[index]),itemCount: articles.length,),
    //       );
    //     },);
  }
}
