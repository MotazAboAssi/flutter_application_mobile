import 'package:first_project/data/category_available.dart';
import 'package:first_project/data/theme.dart';
import 'package:first_project/models/list_category.dart';
import 'package:first_project/models/list_news.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            Text(
              "Syria",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: secondary,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: secondary,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 16 / 3,
                child: ListCategory(categories: categories),
              ),
            ),
            ListNews(),
          ],
        ),
      ),
      // ***********************************************

      // Column(
      //   children: [
      //     AspectRatio(
      //       aspectRatio: 16 / 3,
      //       child: ListViewBuilderCategory(categories: categories),
      //     ),
      //     Expanded(
      //       child: CustomScrollView(

      //         slivers: [
      //           SliverToBoxAdapter(
      //             child: Container(
      //               height: 100,
      //               color: Colors.amber,
      //               child: Center(child: Text("Normal Widget Inside")),
      //             ),
      //           ),
      //           SliverList(
      //             delegate: SliverChildBuilderDelegate(
      //               (context, index) =>
      //                   ListTile(title: Text("List Item $index")),
      //               childCount: 10,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     // Expanded(child: ListViewBuilderNews()),
      //   ],
      // ),

      // ************************************
      //  CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: EdgeInsets.all(8),
      //         child: Text("Grid Section", style: TextStyle(fontSize: 20)),
      //       ),
      //     ),
      //     SliverGrid(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => Container(
      //           color: Colors.blue[100 * ((index % 8) + 1)],
      //           child: Center(child: Text("Grid $index")),
      //         ),
      //         childCount: 8,
      //       ),
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         mainAxisSpacing: 4,
      //         crossAxisSpacing: 4,
      //         childAspectRatio: 1.5,
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => ListTile(title: Text("More Items $index")),
      //         childCount: 5,
      //       ),
      //     ),
      //   ],
      // ),

      // ********************************************************
      // CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: AspectRatio(
      //         aspectRatio: 16 / 3,
      //         child: ListViewBuilderCategory(categories: categories),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => ListTile(title: Text("List Item $index")),
      //         childCount: 10,
      //       ),
      //     ),
      //   ],
      // ),
      // *******************************************
      //        Column(
      //         children: [
      //           AspectRatio(
      //             aspectRatio: 16 / 3,
      //             child: ListViewBuilderCategory(categories: categories),
      //           ),
      // Expanded(child: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Container(
      //         height: 100,
      //         color: Colors.amber,
      //         child: Center(child: Text("Normal Widget Inside")),
      //       ),
      //     ),
      //     SliverList(

      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => ListTile(title: Text("List Item $index")),
      //         childCount: 10,

      //       ),
      //     ),
      //   ],
      // )
      // )
      //           // Expanded(child: ListViewBuilderNews()),
      //         ],
      //       ),
    );
  }
}
