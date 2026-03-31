import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomeTextField extends StatelessWidget {
  final String name;
  final String? initialValue, hintText;
  final List<String? Function(String?)> validators;
  const CustomeTextField({
    super.key,
    required this.name,
    this.initialValue,
    this.hintText,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,

      initialValue: initialValue, // from login
      validator: FormBuilderValidators.compose(validators),
      decoration: InputDecoration(
        labelText: name,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor),
        ),
        floatingLabelStyle: TextStyle(color: primaryColor),
      ),
    );
  }
}