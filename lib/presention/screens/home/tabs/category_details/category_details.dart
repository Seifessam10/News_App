import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manger.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/data_model/category_dm.dart';
import 'package:news_app/presention/screens/home/tabs/category_details/category_details_view_model.dart';
import 'package:news_app/presention/screens/home/tabs/category_details/widget/sources_tab_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDm categoryDm;

  CategoryDetails({super.key, required this.categoryDm});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources = [];

  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDm.backEndId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManger.green,
              ),
            );
          }
          if (viewModel.errorMessage != null) {
            return Text(viewModel.errorMessage!);
          }
          return SourcesTabWidget(sources: viewModel.sources!);
        },
      ),
    );

    // return FutureBuilder(
    //     future: ApiManger.getSources(widget.categoryDm.backEndId),
    //     builder: (context, snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return const Center(child:  CircularProgressIndicator(color: ColorsManger.green,),);
    //       }
    //       if(snapshot.data?.status == 'error' || snapshot.hasError){
    //         return Text(snapshot.data?.message ?? 'Check internet connection');
    //       }
    //        sources = snapshot.data!.sources!;
    //
    //        return SourcesTabWidget(sources : sources);
    //
    //
    //
    //     },);
  }
}
