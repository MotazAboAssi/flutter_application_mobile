import 'package:delivery_of_orders/constants/edit_info_form.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/edit_info/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DialogEditPhoneNumber extends StatefulWidget {
  const DialogEditPhoneNumber({super.key});

  @override
  State<DialogEditPhoneNumber> createState() => _DialogEditPhoneNumberState();
}

class _DialogEditPhoneNumberState extends State<DialogEditPhoneNumber> {
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
                "change your phone number :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CustomeTextField(
                name: kPhoneNumber,
                hintText: "+963*********",
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.phoneNumber(
                    regex: RegExp(r'^\+963\d{9}$'),
                  ),
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
