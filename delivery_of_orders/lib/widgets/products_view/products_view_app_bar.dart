import 'package:flutter/material.dart';

AppBar productsViewAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage("assets/images/home/logo.png"),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Text("title store"),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
      ],
    ),
  );
}
