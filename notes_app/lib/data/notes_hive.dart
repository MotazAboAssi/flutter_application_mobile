import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_app/config/constant_key.dart';
import 'package:store_app/types/note_type.dart';

class Boxes {
  static Box<NoteType> getNotes() => Hive.box<NoteType>(kNoteBox);
}
