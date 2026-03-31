import 'package:delivery_of_orders/widgets/home_view/custome_bottom_navigation.dart';
import 'package:delivery_of_orders/widgets/products_view/products_view_app_bar.dart';
import 'package:delivery_of_orders/widgets/products_view/products_view_body.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeBottomNavigation(initialActiveIndex: 0),
      appBar: productsViewAppBar(),
      body: SafeArea(child: ProductsViewBody()),
    );
  }
}
