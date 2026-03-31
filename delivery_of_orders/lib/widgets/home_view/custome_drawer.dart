import 'package:delivery_of_orders/constants/theme.dart';
import 'package:delivery_of_orders/widgets/home_view/custome_drawer_header.dart';
import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: lightBackgroundColor,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
          color: lightBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(color: backgroundColor, child: CustomeDrawerHeader()),
              Container(
                color: backgroundColor,
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(8),
                child: Row(
                  spacing: 20,
      
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [Icon(Icons.info_rounded)]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("+963998548589"),
                        Text("Mobile", style: TextStyle(color: Colors.blueGrey)),
                        Text(
                          "@".trim() +
                              "Motaz Abo Assi".trim().replaceAll(" ", "_"),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          "Username",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        Text("Damascuse"),
                        Text(
                          "location",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Container(
                color: backgroundColor,
                child: ListTile(
                  leading: Icon(Icons.remove_circle, color: errorColor),
                  title: Text(
                    "LOGOUT",
                    style: TextStyle(
                      color: errorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
