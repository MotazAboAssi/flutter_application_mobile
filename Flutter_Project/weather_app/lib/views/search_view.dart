import 'package:flutter/material.dart';
import 'package:project/models/search_feild.dart';

class SearchView extends StatefulWidget {
  final Color color;
  const SearchView({super.key, required this.color});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ابحث عن مدينة", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: widget.color,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: SearchField(controller: controller, widget: widget),
          ),
        ),
      ),
    );
  }
}
