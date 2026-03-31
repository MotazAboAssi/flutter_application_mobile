
  import 'package:flutter/material.dart';

AppBar homeAppBar() {
    return AppBar(
      // automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
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
              );
            },
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
    );
  }
