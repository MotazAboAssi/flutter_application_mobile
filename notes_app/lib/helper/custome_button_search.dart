import 'package:flutter/material.dart';

class CustomeButtonSearch extends StatelessWidget {
  const CustomeButtonSearch({super.key, required this.isClick});

  final ValueNotifier<bool> isClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),
      onPressed: () {
        isClick.value = !isClick.value;
      },
      child: Icon(Icons.search, size: 30, color: Colors.white),
    );
  }
}
