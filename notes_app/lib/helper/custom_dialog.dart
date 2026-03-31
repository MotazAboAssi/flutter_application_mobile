import 'package:flutter/material.dart';
import 'package:store_app/actions/update_note.dart';
import 'package:store_app/types/note_type.dart';

class CustomDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final NoteType oldNote, newNote;
  const CustomDialog({
    super.key,
    required this.formKey,
    required this.oldNote,
    required this.newNote,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Do you Confirm ??",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Discard",

                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      updateNote(oldNote, newNote);
                      Navigator.of(context).pop();
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
