import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int maxLines;
  final String labelText;
  final String? initialValue;
  final String? Function(String?) validator;
  final GlobalKey<FormFieldState> keyFromForm;

  const CustomTextField({
    super.key,
    required this.maxLines,
    required this.labelText,
    required this.validator,
    required this.keyFromForm,
    this.initialValue,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        key: widget.keyFromForm,
        initialValue: widget.initialValue,
        validator: widget.validator,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
