import 'package:flutter/material.dart';
import 'package:store_app/types/note_type.dart';
import 'package:store_app/widgets/app_bar_update_view.dart';
import 'package:store_app/widgets/body_update_view.dart';

class UpdateView extends StatefulWidget {
  final NoteType note;
  final int indexNoteInBox;

  const UpdateView({
    super.key,
    required this.note,
    required this.indexNoteInBox,
  });

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  late final GlobalKey<FormState> formKey;
  late final GlobalKey<FormFieldState> title;
  late final GlobalKey<FormFieldState> description;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    title = GlobalKey<FormFieldState>();
    description = GlobalKey<FormFieldState>();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    title.currentState?.dispose();
    description.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarUpdateNote(
            formKey: formKey,
            title: title,
            description: description,
            indexNote: widget.indexNoteInBox,
          ),
          BodyUpdateNote(
            formKey: formKey,
            note: widget.note,
            title: title,
            description: description,
          ),
        ],
      ),
    );
  }
}
