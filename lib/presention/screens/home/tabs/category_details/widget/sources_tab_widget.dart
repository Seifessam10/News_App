import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/sources_response/sources.dart';
import 'package:news_app/presention/screens/home/tabs/articles/article_list_widget.dart';
import 'package:news_app/presention/screens/home/tabs/category_details/widget/source_item_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sources;

  SourcesTabWidget({super.key, required this.sources});

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              tappedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.sources
                .map((source) => SourceItemWidget(
                    source: source,
                    isSelected: widget.sources.indexOf(source) == tappedIndex))
                .toList(),
          ),
        ),
        ArticleListWidget(source: widget.sources[tappedIndex]),
      ],
    );
  }
}
