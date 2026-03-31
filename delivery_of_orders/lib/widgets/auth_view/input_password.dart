import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputPassword extends StatelessWidget {
  final String  labelText;
  final List<String? Function(String?)> validators;

  const InputPassword({
    super.key,
    required this.labelText,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> encoded = ValueNotifier<bool>(false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: encoded,
        builder: (context, isEncoded, child) {
          return FormBuilderTextField(
            style: TextStyle(color: primaryTextColor),
            obscureText: isEncoded,
            name: labelText,
            validator: FormBuilderValidators.compose(validators),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () => encoded.value = !isEncoded,
                child: Icon(
                  isEncoded ? Icons.remove_red_eye : Icons.remove,
                  color: primaryTextColor,
                  // size: 20,
                ),
              ),
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

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              // hint && label style
              hintText: "********",
              hintStyle: TextStyle(color: primaryTextColor),
              labelText: labelText,
              labelStyle: TextStyle(color: primaryTextColor),
            ),
          );
        },
      ),
    );
  }
}
