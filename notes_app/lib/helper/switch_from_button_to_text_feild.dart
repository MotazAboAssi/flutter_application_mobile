import 'package:flutter/material.dart';
import 'package:store_app/helper/custome_button_search.dart';
import 'package:store_app/helper/input_search.dart';

class SwitchFromButtonToTextFeild extends StatelessWidget {
  final ValueNotifier<String> filter;

  const SwitchFromButtonToTextFeild({
    super.key,
    required this.isClick,
    required this.filter,
  });

  final ValueNotifier<bool> isClick;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isClick,
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: isClick.value ? MediaQuery.of(context).size.width * 0.6 : 50,
          height: 50,
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            firstChild: InputSearch(isClick: isClick, filter: filter),
            secondChild: CustomeButtonSearch(isClick: isClick),
            crossFadeState: isClick.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        );
      },
    );
  }
}
