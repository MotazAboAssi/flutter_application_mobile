import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_text_field.dart';
import 'package:store_app/types/note_type.dart';

class FormNote extends StatelessWidget {
  final NoteType? note;
  final GlobalKey<FormState> formKey;
  final GlobalKey<FormFieldState> title, description;

  const FormNote({
    super.key,
    required this.formKey,
    required this.title,
    required this.description,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomTextField(
          keyFromForm: title,
          initialValue: note?.title,
          maxLines: 1,
          labelText: 'title',
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "this field is require";
            } else if (value!.length < 2) {
              return "title mustn't less than 3 character ";
            } else {
              formKey.currentState!.save();
              value = null;

              return null;
            }
          },
        ),
        CustomTextField(
          keyFromForm: description,
          initialValue: note?.description,
          maxLines: 5,
          labelText: 'content',
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "this field is require";
            } else if (value!.length < 6) {
              return "title mustn't less than 7 character ";
            } else {
              formKey.currentState!.save();
              value = null;
              return null;
            }
          },
        ),
      ],
    );
  }
}
