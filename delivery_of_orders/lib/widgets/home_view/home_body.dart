import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/widgets/home_view/store_card.dart';
import 'package:delivery_of_orders/widgets/products_view/products_view_body.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
                    await Navigator.pushNamed(context, kProductsView);
                  },
                  child: StoreCard(),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 16 / 9,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
