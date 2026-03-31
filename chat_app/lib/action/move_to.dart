import 'package:flutter/material.dart';

void moveToRouteName(BuildContext context, String routeName) async {
  await Navigator.pushNamed(context, routeName);
}

void moveToWidget(BuildContext context, Widget widget) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
  );
}
