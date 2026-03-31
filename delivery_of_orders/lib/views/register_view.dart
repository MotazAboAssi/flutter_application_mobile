import 'package:delivery_of_orders/actions/back_to.dart';
import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/auth_view/circule_logo.dart';
import 'package:delivery_of_orders/widgets/auth_view/form_register.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            CirculeLogo(logo: kLogoRegister),
            FormRegister(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Do you have an account ?? ", softWrap: true),
                GestureDetector(
                  onTap: () {
                    backTo(context);
                  },
                  child: Text("login", style: TextStyle(color: linkColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
