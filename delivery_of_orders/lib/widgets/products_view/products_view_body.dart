import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/products_view/product_card.dart';
import 'package:flutter/material.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.center,
          child: Image(
            opacity: const AlwaysStoppedAnimation(0.5),
            image: AssetImage("assets/images/home/logo.png"),
          ),
        ),
        CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () async {
                    await Navigator.pushNamed(context, kInfoProductView);
                  },
                  child: ProductCard(),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}