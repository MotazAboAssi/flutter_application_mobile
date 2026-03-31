import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                    // await Navigator.pushNamed(context, kProductsView);
                  },
                  child: ProductInCart(),
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

class ProductInCart extends StatelessWidget {
  const ProductInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryHeavy,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                width: constraints.maxWidth * 0.4,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey, Colors.white],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  image: DecorationImage(image: AssetImage(kLogoRegister)),
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.6,
                padding: EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "title Store",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.white),
                      title: Text(
                        "Damascuse",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryTextColor,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryTextColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.white),
                      title: Text(
                        "+963998548589",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: primaryTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
