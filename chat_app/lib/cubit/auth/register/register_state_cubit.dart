import 'package:chat_app/cubit/auth/auth_state_cubit.dart';
import 'package:chat_app/types/register_type.dart';

class UnderRegistrationInRegister extends AuthStateCubit {}

class RegisterSuccessfuly extends AuthStateCubit {
  final RegisterType user;

  RegisterSuccessfuly({required this.user});
}

class RegisterFailed extends AuthStateCubit {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}
