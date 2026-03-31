import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);
    return Card(
      color: primaryHeavy,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: constraints.maxWidth,
                height: 2 * constraints.maxHeight / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey, Colors.white],
                    begin: AlignmentGeometry.topLeft,
                    end: AlignmentGeometry.bottomRight,
                  ),
                  image: DecorationImage(image: AssetImage(kLogoLogin)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$50",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            isFavorite.value = !(isFavorite.value);
                          },
                          icon: ValueListenableBuilder(
                            valueListenable: isFavorite,
                            builder: (context, favorite, child) {
                              return Icon(
                                favorite
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_outline_sharp,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "title Product",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: primaryTextColor, fontSize: 15),
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



/*
LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 40,
                    child: Image(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 2,
                      image: AssetImage(
                        "assets/images/auth_page/delivery_of_orders_login.png",
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$50"),
                          ValueListenableBuilder(
                            valueListenable: isFavorite,
                            builder: (context, favorite, child) {
                              return IconButton(
                                onPressed: () {
                                  isFavorite.value = !(isFavorite.value);
                                },
                                icon: Icon(
                                  isFavorite.value
                                      ? Icons.favorite_outline_sharp
                                      : Icons.favorite_outline_sharp,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Text(
                        "title Product",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              );
            },
          )
 */