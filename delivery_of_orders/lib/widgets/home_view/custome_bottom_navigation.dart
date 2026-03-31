import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delivery_of_orders/actions/navigate_to.dart';
import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class CustomeBottomNavigation extends StatelessWidget {
  final double fontSize = 7;
  final int initialActiveIndex;
  const CustomeBottomNavigation({super.key, required this.initialActiveIndex});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: initialActiveIndex,
      onTap: (index) {
        if (index == 0) {
          navigateTo(context, kHomeView);
        } else if (index == 1) {
          navigateTo(context, kCartView);
        }
      },
      backgroundColor: primaryColor,
      items: [
        TabItem(
          icon: Icon(Icons.home, size: 26, color: Colors.white70),
          activeIcon: Icon(Icons.home, color: primaryColor, size: 40),
        ),
        tabItemWithBadge(
          icon: Icons.local_grocery_store_rounded,
          action: () => navigateTo(context, kCartView),
        ),
        tabItemWithBadge(
          icon: Icons.favorite,
          action: () => navigateTo(context, kCartView),
        ),
      ],
      top: -15,
    );
  }

  TabItem<dynamic> tabItemWithBadge({
    required IconData icon,
    required void Function()? action,
  }) {
    return TabItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, size: 26, color: Colors.white70),
          Positioned(
            right: -5,
            top: -10,
            child: CircleAvatar(
              radius: fontSize + 1,
              backgroundColor: linkColor,
              child: Text(
                "+99",
                style: TextStyle(fontSize: fontSize, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      activeIcon: Icon(icon, color: primaryColor, size: 40),
    );
  }
}
