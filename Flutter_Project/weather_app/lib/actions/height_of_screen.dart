import 'package:flutter/widgets.dart';

double heightOfScreen(BuildContext context, double rate) {
  return MediaQuery.of(context).size.height * rate;
}
