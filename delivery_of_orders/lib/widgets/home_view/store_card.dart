import 'package:delivery_of_orders/constants/images.dart';
import 'package:delivery_of_orders/constants/theme.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key});

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
                  image: DecorationImage(image: AssetImage(kLogoLogin)),
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
