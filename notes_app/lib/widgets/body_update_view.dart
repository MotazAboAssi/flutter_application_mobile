import 'package:flutter/material.dart';
import 'package:store_app/helper/form_note.dart';
import 'package:store_app/types/note_type.dart';

class BodyUpdateNote extends StatelessWidget {
  final NoteType note;
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormFieldState> title;
  final GlobalKey<FormFieldState> description;

  const BodyUpdateNote({
    super.key,
    required this.formKey,
    required this.note,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: const EdgeInsets.all(15),
            width: constraints.maxWidth,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: FormNote(
                formKey: formKey,
                title: title,
                description: description,
                note: note,
              ),
            ),
          );
        },
      ),
    );
  }
}
