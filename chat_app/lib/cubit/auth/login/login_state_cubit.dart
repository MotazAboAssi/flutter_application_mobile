
import 'package:chat_app/cubit/auth/auth_state_cubit.dart';
import 'package:chat_app/types/login_type.dart';

class UnderRegistrationLogIn extends AuthStateCubit {}

class LoginSuccessfuly extends AuthStateCubit {
  final LoginType user;

  LoginSuccessfuly({required this.user});
}

class LoginFailed extends AuthStateCubit {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
}
