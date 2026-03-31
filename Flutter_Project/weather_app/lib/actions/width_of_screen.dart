import 'package:flutter/widgets.dart';

double widthOfScreen(BuildContext context, double rate) {
  return MediaQuery.of(context).size.width * rate;
}
