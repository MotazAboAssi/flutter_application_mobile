import 'package:flutter/material.dart';

void moveTo(BuildContext context, Widget target) {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => target),
  );
}
