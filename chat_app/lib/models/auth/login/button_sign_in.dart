import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:chat_app/cubit/auth/auth_cubit.dart';
import 'package:chat_app/cubit/auth/auth_state_cubit.dart';
import 'package:chat_app/cubit/auth/login/login_state_cubit.dart';
import 'package:chat_app/cubit/auth/register/register_state_cubit.dart';
import 'package:chat_app/models/auth/form/custom_snak_bar.dart';
import 'package:chat_app/constant/theme.dart';

class ButtonSignIn extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const ButtonSignIn({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.select<AuthCubit, void Function()?>((value) {
        final state = value.state;
        final form = formKey.currentState;
        if (state is LoginSuccessfuly || state is UnderRegistrationLogIn) {
          return null;
        } else {
          return () async {
            if (form != null) {
              form.save();
              if (form.validate()) {
                final Map<String, dynamic> input = form.value;
                if ((input["email"] ?? "").isEmpty ||
                    (input["password"] ?? "").isEmpty) {
                  return;
                }
                final cubit = BlocProvider.of<AuthCubit>(context);
                try {
                  await cubit.login(input);
                } on FirebaseException catch (e) {
                  log(e.code);
                } catch (e) {
                  log(e.toString());
                }
              }
              // form.patchValue({"email": "mo@dd.c", "password": "123cvbASD/*-"});
            }
          };
        }
      }),

      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: context.select<AuthCubit, Color?>((value) {
          final state = value.state;
          if (state is LoginSuccessfuly) {
            return Colors.green;
          } else if (state is UnderRegistrationLogIn) {
            return Colors.grey;
          } else {
            return null;
          }
        }),
        padding: EdgeInsetsGeometry.zero,
        alignment: Alignment.center,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.25,
          MediaQuery.of(context).size.height * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),

        backgroundColor: Colors.lightBlue,
      ),

      child: BlocConsumer<AuthCubit, AuthStateCubit>(
        builder: (context, state) {
          if (state is LoginFailed ||
              state is RegisterFailed ||
              state is RegisterSuccessfuly ||
              state is InitialAuth) {
            // printWhite("register : ${(state is InitialLogin).toString()}");
            return Text(
              "Sign in",
              style: TextStyle(color: primaryThemTextButton),
            );
          } else if ((state is LoginSuccessfuly)) {
            return Center(
              child: Icon(Icons.check_rounded, color: Colors.white, size: 25),
            );
          }
          return SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: Colors.white),
          );
        },
        listener: (context, state) {
          if ((state is LoginSuccessfuly)) {
            customSnakBar(
              context: context,
              state: state,
              color: Colors.green,
              message: '✅ Login Successfuly',
            );
          } else if (state is LoginFailed) {
            customSnakBar(
              context: context,
              state: state,
              color: Colors.red,
              message: state.errorMessage,
            );
          }
        },
      ),
    );
  }
}
