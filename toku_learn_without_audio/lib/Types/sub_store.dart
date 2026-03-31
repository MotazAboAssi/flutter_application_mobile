import 'package:first_project/Types/data.dart';
import 'package:flutter/material.dart';

class SubStore {
  final String nameEn;
  final String nameJP;
  final IconData icon;
  final List<Data> data;

  const SubStore({
    required this.nameEn,
    required this.nameJP,
    required this.icon,
    required this.data,
  });
}
