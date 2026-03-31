import 'package:dio/dio.dart';
import 'package:first_project/models/news_model.dart';
import 'package:first_project/service/http_requist.dart';
import 'package:first_project/types/news_type.dart';
import 'package:flutter/material.dart';

class ListNews extends StatefulWidget {
  final String? category;
  const ListNews({super.key, this.category});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  Future<List<NewsType>>? future;
  @override
  void initState() {
    super.initState();
    future = HttpRequist(dio: Dio()).getByCategory(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final NewsType news = snapshot.data![index];
                return NewsModel(news: news);
              }, childCount: snapshot.data!.length),
            );
          } else {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "⚠️ No Data YET",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                "Sorry 😢,maybe occurred Wrong. PLS , try again.\n 1. configure from connect with internet.\n 2. active proxy.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
