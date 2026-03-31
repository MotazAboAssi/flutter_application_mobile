import 'package:flutter/material.dart';

void moveTo(BuildContext context, Widget widget) {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
  );
}
