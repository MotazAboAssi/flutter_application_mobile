import 'package:delivery_of_orders/constants/routes.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/test/navigation_observe.dart';
import 'package:delivery_of_orders/views/cart_view.dart';
import 'package:delivery_of_orders/views/edit_info.dart';
import 'package:delivery_of_orders/views/home_view.dart';
import 'package:delivery_of_orders/views/info_product_view.dart';
import 'package:delivery_of_orders/views/login_view.dart';
import 'package:delivery_of_orders/views/products_view.dart';
import 'package:delivery_of_orders/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';

void main() async {
  // var cart = FlutterCart();
  // await cart.initializeCart(isPersistenceSupportEnabled: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [Observ()],
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: primaryTextColor),
          titleTextStyle: TextStyle(color: primaryTextColor, fontSize: 25),
          backgroundColor: primaryColor,
        ),
      ),
      routes: {
        kLoginView: (context) => LoginView(),
        kRegisterView: (context) => RegisterView(),
        kHomeView: (context) => HomeView(),
        kEditInfoView: (context) => EditInfo(),
        kInfoProductView: (context) => InfoProductView(),
        kProductsView: (context) => ProductsView(),
        kCartView: (context) => CartView(),
      },
      initialRoute: kProductsView,
    );
  }
}
