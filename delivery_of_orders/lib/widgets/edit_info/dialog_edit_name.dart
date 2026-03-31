import 'package:delivery_of_orders/constants/edit_info_form.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/edit_info/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogEditName extends StatefulWidget {
  const DialogEditName({super.key});

  @override
  State<DialogEditName> createState() => _DialogEditNameState();
}

class _DialogEditNameState extends State<DialogEditName> {
  late GlobalKey<FormBuilderState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormBuilderState>();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FormBuilder(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "change your name :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CustomeTextField(
                name: kFirstName,
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.firstName(),
                ],
              ),
              CustomeTextField(
                name: kLastName,
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.lastName(),
                ],
              ),

              Align(
                alignment: AlignmentGeometry.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: primaryTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
