import 'package:store_app/data/notes_hive.dart';
import 'package:store_app/types/note_type.dart';

Future<void> addNote(NoteType note) async {
  final boxs = Boxes.getNotes();
  await boxs.add(note);
}
