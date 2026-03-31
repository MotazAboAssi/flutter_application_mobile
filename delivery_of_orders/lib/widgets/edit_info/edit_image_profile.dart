import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class EditImageProfile extends StatelessWidget {
  const EditImageProfile({super.key, required this.maxRadius});

  final double maxRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          maxRadius: 50,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kManAvatarProfile),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            maxRadius: maxRadius + 3,
            backgroundColor: backgroundColor,
            child: CircleAvatar(
              backgroundColor: primaryColor,
              maxRadius: maxRadius,
              child: Icon(Icons.camera_alt, size: maxRadius + 5, color: primaryTextColor,),
            ),
          ),
        ),
      ],
    );
  }
}
