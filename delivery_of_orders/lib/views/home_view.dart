import 'package:delivery_of_orders/widgets/home_view/custome_bottom_navigation.dart';
import 'package:delivery_of_orders/widgets/home_view/custome_drawer.dart';
import 'package:delivery_of_orders/widgets/home_view/home_app_bar.dart';
import 'package:delivery_of_orders/widgets/home_view/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeBottomNavigation(initialActiveIndex: 0,),
      drawer: Drawer(child: CustomeDrawer()),
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }
}
