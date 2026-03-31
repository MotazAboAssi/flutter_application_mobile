import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputTextForm extends StatelessWidget {
  final String labelText, hintText;
  final List<String? Function(String?)> validators;

  const InputTextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        name: labelText,
        validator: FormBuilderValidators.compose(validators),
        style: TextStyle(color: primaryTextColor),
        decoration: InputDecoration(
          // border style
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryTextColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: errorColor),
          ),
          errorStyle: TextStyle(color: errorColor),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          // hint && label style
          hintText: hintText,
          hintStyle: TextStyle(color: primaryTextColor),
          labelText: labelText,
          labelStyle: TextStyle(color: primaryTextColor),
        ),
      ),
    );
  }
}
