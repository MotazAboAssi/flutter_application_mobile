import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class InfoProductAppBar extends StatelessWidget {
  const InfoProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [backgroundColor, Colors.white],
          begin: AlignmentGeometry.bottomCenter,
          end: AlignmentGeometry.topCenter,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
