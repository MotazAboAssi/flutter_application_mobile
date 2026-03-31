import 'package:first_project/Data/colors.dart';
import 'package:first_project/Data/family_member.dart';
import 'package:first_project/Data/number_japan.dart';
import 'package:first_project/Data/phrases.dart';
import 'package:first_project/Types/sub_store.dart';
import 'package:flutter/material.dart';

final List<SubStore> store = [
  SubStore(
    nameEn: "Numbers",
    nameJP: "番号",
    icon: Icons.numbers,
    data: numbersJapan,
  ),
  SubStore(
    nameEn: "Family",
    nameJP: "家族",
    icon: Icons.family_restroom,
    data: familyMembersJapan,
  ),
  SubStore(
    nameEn: "Colors",
    nameJP: "色",
    icon: Icons.color_lens,
    data: colorsJapan,
  ),
  SubStore(
    nameEn: "Phrases",
    nameJP: "フレーズ",
    icon: Icons.menu_book_sharp,
    data: phrasesJapan,
  ),
];
