import 'package:firebase_auth/firebase_auth.dart';

void checkEmail(String email) {
  try {
    final methods = FirebaseAuth.instance.isSignInWithEmailLink(email);

    if (methods) {
      print('✅ Email exists, sign-in methods: $methods');
    } else {
      print('❌ Email not found.');
    }
  } on FirebaseAuthException catch (e) {
    print('Error: ${e.code} — ${e.message}');
  }
}
