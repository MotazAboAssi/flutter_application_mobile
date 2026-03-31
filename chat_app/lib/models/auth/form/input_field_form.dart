import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:chat_app/models/auth/form/decoration_input_field.dart';
import 'package:chat_app/constant/theme.dart';

class InputFieldForm extends StatelessWidget {
  final String name, hintText, labelTeaxt;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<String? Function(String?)>? validatorsProps;
  const InputFieldForm({
    super.key,
    required this.name,
    required this.hintText,
    required this.labelTeaxt,
    this.suffixIcon,
    this.obscureText,
    this.validatorsProps, this.initialValue,

  });

  @override
  Widget build(BuildContext context) {
    final List<String? Function(String?)> validators =
        validatorsProps ?? const [];
    validators.add(FormBuilderValidators.required());

    return FormBuilderTextField(
      initialValue: initialValue,
      name: name,
      obscureText: suffixIcon != null && obscureText == true,
      obscuringCharacter: "*",
      style: TextStyle(color: primaryThemeText), // text color
      cursorColor: primaryThemeText, // cursor color
      keyboardType: TextInputType.emailAddress,
      decoration: decorationInputFieldLogin(
        hintText: hintText,
        labelTeaxt: labelTeaxt,
        suffixIcon: suffixIcon,
      ),
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
