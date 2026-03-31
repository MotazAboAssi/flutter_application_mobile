import 'package:store_app/types/note_type.dart';

bool isNoteContentString(String str, NoteType note) {
  if (note.title.contains(str) ||
      note.description.contains(str) ||
      note.date.toString().contains(str)) {
    return true;
  }
  return false;
}
