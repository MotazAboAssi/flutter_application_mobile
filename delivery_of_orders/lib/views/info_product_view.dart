import 'package:delivery_of_orders/widgets/info_product_view/info_product_app_bar.dart';
import 'package:delivery_of_orders/widgets/info_product_view/info_product_body.dart';
import 'package:flutter/material.dart';

class InfoProductView extends StatelessWidget {
  const InfoProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints screen) {
            return Column(
              children: [
                InfoProductAppBar(),
                InfoProductBody(isFavorite: isFavorite, screen: screen),
              ],
            );
          },
        ),
      ),
    );
  }
}
