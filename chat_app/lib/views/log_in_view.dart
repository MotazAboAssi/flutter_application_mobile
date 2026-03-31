import 'package:flutter/material.dart';
import 'package:chat_app/action/move_to.dart';
import 'package:chat_app/models/auth/login/login_form.dart';
import 'package:chat_app/models/auth/form/text_response.dart';
import 'package:chat_app/constant/routes.dart';
import 'package:chat_app/constant/theme.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                // Image
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width * 0.25,
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/scholar.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Title App
                Text(
                  "Scholar Chat",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontFamily: "Pacifico",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: LoginForm(),
            ),
            // Move to Sign up
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextResponse(
                      "don't have an account ? ",
                      style: TextStyle(color: primaryThemeText),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      moveToRouteName(context, kRegisterView);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xffc7ede6)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
