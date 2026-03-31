import 'package:delivery_of_orders/constants/auth_form.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/auth_view/input_password.dart';
import 'package:delivery_of_orders/widgets/auth_view/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Column(
            children: [
              InputTextForm(
                labelText: kInputPhoneNumber,
                hintText: "+963*********",
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.phoneNumber(
                    regex: RegExp(r'^\+963\d{9}$'),
                  ),
                ],
              ),
              InputPassword(
                labelText: kInputPassword,
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.password(),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
