import 'package:flutter/material.dart';
import 'package:store_app/helper/home_screen/floating_image.dart';
import 'package:store_app/widgets/home_screen/card_model.dart';
import 'package:store_app/types/product_type.dart';

class ProductModel extends StatelessWidget {
  final ProductType product;
  const ProductModel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            CardModel(title: product.title,description:product.description, price: product.price,),
            FloatingImage(
              widthParent: constraints.maxWidth,
              heightParent: constraints.maxHeight,
              urlImage: product.image,
            ),
          ],
        );
      },
    );
  }
}
