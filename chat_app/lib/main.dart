
import 'package:chat_app/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:chat_app/cubit/auth/auth_cubit.dart';
import 'package:chat_app/constant/routes.dart';
import 'package:chat_app/views/log_in_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    BlocProvider(create: (BuildContext context) => AuthCubit(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        kRegisterView: (context) => RegisterView(),
        kLogInView: (context) => LogInView(),
        kChatView: (context) => ChatView(),
      },
      supportedLocales: [Locale('ar'), Locale('en')],
      localizationsDelegates: [FormBuilderLocalizations.delegate],
      initialRoute: kLogInView,
    );
  }
}
