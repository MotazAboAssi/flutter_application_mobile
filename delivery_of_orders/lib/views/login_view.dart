import 'package:delivery_of_orders/actions/navigate_to.dart';
import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/auth_view/circule_logo.dart';
import 'package:delivery_of_orders/widgets/auth_view/form_login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CirculeLogo(logo: kLogoLogin),
            FormLogin(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Don't you have an account ?? ", softWrap: true),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, kRegisterView);
                  },
                  child: Text("Register", style: TextStyle(color: linkColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
