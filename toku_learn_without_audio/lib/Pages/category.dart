import 'package:first_project/Actions/logic_view_item.dart';
import 'package:first_project/Data/store.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final int id;
  static bool isRunAnything = false;
  const Category({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        leading: IconButton(
          onPressed: () {
            Category.isRunAnything = false;
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text(
            "${store[id].nameEn} (${store[id].nameJP})",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),

      body: ListView(children: logicViewItem(id)),
    );
  }
}
