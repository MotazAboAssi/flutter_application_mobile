import 'package:first_project/data/theme.dart';
import 'package:first_project/models/list_news.dart';
import 'package:first_project/types/category_type.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final CategoryType category;
  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.ar), centerTitle: true),
      body: Container(
        color: secondary,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [ListNews(category: category.en)]),
      ),
    );
  }
}
