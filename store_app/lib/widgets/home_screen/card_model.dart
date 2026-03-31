import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  final String title, description;
  final double price;

  const CardModel({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {    
    final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: -15, offset: Offset(0, 10)),
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ $price"),
                  ValueListenableBuilder(
                    valueListenable: isFavorite,
                    builder: (BuildContext context, value, Widget? child) =>
                        IconButton(
                          onPressed: () {
                            isFavorite.value = !isFavorite.value;
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite.value ? Colors.red : null,
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
