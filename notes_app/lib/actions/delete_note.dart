import 'package:store_app/data/notes_hive.dart';
import 'package:store_app/types/note_type.dart';

Future<void> deleteNote(NoteType note) async {
  await note.delete();
}
