import 'package:store_app/types/note_type.dart';

Future<void> updateNote(NoteType oldNote, NoteType newNote) async {
  oldNote.title = newNote.title;
  oldNote.description = newNote.description;
  oldNote.date = newNote.date;
  await oldNote.save();
}
