import 'package:flutter/material.dart';

void moveTo(BuildContext context, final Widget target) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => target),
  );
}
