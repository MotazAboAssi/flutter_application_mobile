import 'package:first_project/Data/store.dart';
import 'package:first_project/Models/button_category.dart';
import 'package:first_project/Types/category_props.dart';
import 'package:flutter/material.dart';

List<Widget> logicViewButton() {
  int i = 1;

  final List<CategoryProps> categorys = store.map((subStore) {
    i++;

    return CategoryProps(
      nameEN: subStore.nameEn,
      nameJB: subStore.nameJP,
      icon: subStore.icon,
      background: i % 2 == 0 ? Colors.red : Colors.white,
    );
  }).toList();

  i = 0;

  List<Widget> list = categorys
      .map((category) => ButtonCategory(id: i++, props: category))
      .toList();
  return list;
}
