import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class CirculeLogo extends StatelessWidget {
  final String logo;
  const CirculeLogo({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.40,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          color: primaryColor,
          image: DecorationImage(image: AssetImage(logo)),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
