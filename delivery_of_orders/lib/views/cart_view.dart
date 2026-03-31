import 'package:delivery_of_orders/widgets/cart_view/cart_view_body.dart';
import 'package:delivery_of_orders/widgets/home_view/custome_bottom_navigation.dart';
import 'package:delivery_of_orders/widgets/home_view/custome_drawer.dart';
import 'package:delivery_of_orders/widgets/home_view/home_app_bar.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeBottomNavigation(initialActiveIndex: 1),
      drawer: Drawer(child: CustomeDrawer()),
      appBar: homeAppBar(),
      body: CartViewBody(),
    );
  }
}
