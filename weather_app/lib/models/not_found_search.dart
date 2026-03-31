import 'package:flutter/material.dart';

class NotFoundSearch extends StatelessWidget {
  const NotFoundSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      
      " لا يوجد طقس ☹️ ابدأ البحث الآن 🔍",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
    );
  }
}
