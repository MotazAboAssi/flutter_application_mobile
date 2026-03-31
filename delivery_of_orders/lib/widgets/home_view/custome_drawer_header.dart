import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class CustomeDrawerHeader extends StatelessWidget {
  const CustomeDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsetsGeometry.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              maxRadius: 45,
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
          ),
          ListTile(
            title: Text(
              "Motaz Abo Assi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () async {
                await Navigator.pushNamed(context, kEditInfoView);
              },
              icon: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
