import 'package:first_project/Data/store.dart';
import 'package:first_project/Models/button_item.dart';
import 'package:flutter/widgets.dart';

List<Widget> logicViewItem(int id) {
  final String category = store[id].nameEn.toLowerCase();
  int i = -1;
  final List<Widget> list = store[id].data.map((data) {
    i++;
    return ButtonItem(props: data, id: i, category: category,);
  }).toList();

  return list;
}
