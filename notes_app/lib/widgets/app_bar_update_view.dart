import 'package:flutter/material.dart';
import 'package:store_app/data/notes_hive.dart';
import 'package:store_app/helper/custom_dialog.dart';
import 'package:store_app/types/note_type.dart';

class AppBarUpdateNote extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormFieldState> title;
  final GlobalKey<FormFieldState> description;
  final int indexNote;

  const AppBarUpdateNote({
    super.key,
    required this.formKey,
    required this.title,
    required this.description,
    required this.indexNote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Update Note", style: TextStyle(fontSize: 30)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    formKey: formKey,
                    oldNote: Boxes.getNotes().getAt(indexNote)!,
                    newNote: NoteType(
                      title: title.currentState?.value,
                      description: description.currentState?.value,
                      date: DateTime.now(),
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.check, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}
