import 'package:flutter/material.dart';
import 'package:store_app/actions/add_note.dart';
import 'package:store_app/helper/form_note.dart';
import 'package:store_app/types/note_type.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> title = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> description = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.all(15),
          width: constraints.maxWidth,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: keyForm,
            child: Stack(
              children: [
                FormNote(
                  formKey: keyForm,
                  title: title,
                  description: description,
                ),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      fixedSize: Size(constraints.maxWidth * 0.9, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (keyForm.currentState?.validate() ?? false) {
                        addNote(
                          NoteType(
                            title: title.currentState!.value!,
                            description: description.currentState!.value,
                            date: DateTime.now(),
                          ),
                        );
                        keyForm.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
