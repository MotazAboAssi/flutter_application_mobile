import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/info_product_view/swiper_image_product.dart';
import 'package:flutter/material.dart';

class InfoProductBody extends StatelessWidget {
  const InfoProductBody({
    super.key,
    required this.isFavorite,
    required this.screen,
  });

  final ValueNotifier<bool> isFavorite;
  final BoxConstraints screen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 1,
      child: Stack(
        children: [
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: screen.maxWidth,
                height: screen.maxHeight / 2,
                child: SwiperImageProduct(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 175",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: isFavorite,
                          builder: (context, favorite, child) {
                            return IconButton(
                              onPressed: () {
                                isFavorite.value = !(isFavorite.value);
                              },
                              icon: Icon(
                                isFavorite.value
                                    ? Icons.favorite_outlined
                                    : Icons.favorite_outline_sharp,
                                size: 30,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      "title product",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "description product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [backgroundColor, Colors.transparent],
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.topCenter,
                ),
              ),
              width: screen.maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(screen.maxWidth * 0.8, 50),
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: primaryTextColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
