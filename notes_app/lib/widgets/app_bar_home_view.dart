import 'package:flutter/material.dart';
import 'package:store_app/helper/switch_from_button_to_text_feild.dart';

class AppBarHomeView extends StatelessWidget {
  final ValueNotifier<String> filter;
  const AppBarHomeView({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isClick = ValueNotifier(false);
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Notes", style: TextStyle(fontSize: 30)),
          SwitchFromButtonToTextFeild(isClick: isClick, filter: filter),
        ],
      ),
    );
  }
}
