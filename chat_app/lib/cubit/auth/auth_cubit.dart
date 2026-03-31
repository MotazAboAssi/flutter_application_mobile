import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/cubit/auth/auth_state_cubit.dart';
import 'package:chat_app/cubit/auth/login/login_state_cubit.dart';
import 'package:chat_app/cubit/auth/register/register_state_cubit.dart';
import 'package:chat_app/types/login_type.dart';
import 'package:chat_app/types/register_type.dart';

class AuthCubit extends Cubit<AuthStateCubit> {
  AuthCubit() : super(InitialAuth());

  Future<void> register(Map<String, dynamic> user) async {
    emit(UnderRegistrationInRegister());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user["email"],
        password: user["password"],
      );
      emit(
        RegisterSuccessfuly(
          user: RegisterType(
            userName: user["user name"],
            email: user["email"],
            password: user["password"],
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      emit(RegisterFailed(errorMessage: "No Internet"));
    } catch (e) {
      emit(RegisterFailed(errorMessage: "No Internet"));
    }
    // throw Exception(error.toString());
  }

  Future<void> login(Map<String, dynamic> user) async {
    emit(UnderRegistrationLogIn());
    try {
      if (!FirebaseAuth.instance.isSignInWithEmailLink(user["email"])) {
        final s = await FirebaseAuth.instance.authStateChanges().first;
        throw Exception("no exist user");
      }
      emit(
        LoginSuccessfuly(
          user: LoginType(email: user["email"], password: user["password"]),
        ),
      );
    } catch (error) {
      emit(LoginFailed(errorMessage: error.toString()));
      log(error.toString());
    }
  }
}
