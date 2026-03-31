
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:chat_app/cubit/auth/auth_cubit.dart';
import 'package:chat_app/cubit/auth/register/register_state_cubit.dart';
import 'package:chat_app/models/auth/login/button_sign_in.dart';
import 'package:chat_app/models/auth/form/input_field_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isDisplay = ValueNotifier<bool>(false);
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 20,
        children: [
          // Title Inputs
          Text(
            "Sign in",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              color: Colors.white,
            ),
          ),
          // Email Input
          InputFieldForm(
            name: "email",
            hintText: "example@example.example",
            labelTeaxt: "Email",
            validatorsProps: [FormBuilderValidators.email()],
            initialValue: context.select<AuthCubit, String?>((value) {
              final state = value.state;
              if (state is RegisterSuccessfuly) {
                return state.user.email;
              }
              return null;
            }),
          ),
          // Password Input
          ValueListenableBuilder(
            valueListenable: isDisplay,
            builder: (context, value, child) {
              return InputFieldForm(
                name: "password",
                hintText: "********",
                labelTeaxt: "Password",
                validatorsProps: [FormBuilderValidators.password()],
                initialValue: context.select<AuthCubit, String?>((value) {
                  final state = value.state;
                  if (state is RegisterSuccessfuly) {
                    return state.user.password;
                  }
                  return null;
                }),
                suffixIcon: IconButton(
                  onPressed: () {
                    isDisplay.value = !isDisplay.value;
                  },
                  icon: Icon(
                    isDisplay.value ? Icons.remove_red_eye : Icons.remove,
                  ),
                ),
                obscureText: !isDisplay.value,
              );
            },
          ),
          // Button Sign in
          ButtonSignIn(formKey: formKey),
        ],
      ),
    );
  }
}
