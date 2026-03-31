import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_bottom_sheet.dart';

class ActionFloatingButton extends StatelessWidget {
  const ActionFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 25,
      style: IconButton.styleFrom(
        fixedSize: Size.fromRadius(25),
        backgroundColor: Colors.black,
      ),
      onPressed: () async => await showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomSheet(),
      ),
      icon: const Icon(Icons.add),
    );
  }
}
