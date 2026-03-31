import 'package:card_swiper/card_swiper.dart';
import 'package:delivery_of_orders/constants/images.dart' show images;
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class SwiperImageProduct extends StatelessWidget {
  const SwiperImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemWidth: double.infinity,
      itemCount: images.length,
      loop: true,
      autoplay: true,
      duration: 500,
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addTranslate([
          const Offset(0, 0),
          const Offset(0, 0),
          const Offset(0, 0),
        ])
        ..addOpacity([0.0, 1.0, 0.0]),
      itemBuilder: (context, index) {
        return ClipRRect(
          // borderRadius: BorderRadius.circular(16),
          child: Image.asset(images[index], fit: BoxFit.fill),
        );
      },
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: primaryColor,
        ),
      ),
    );
  }
}
