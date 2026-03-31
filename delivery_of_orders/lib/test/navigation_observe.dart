import 'dart:developer';

import 'package:flutter/material.dart';

class Observ extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log("push : ${route.settings.name ?? "null"}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log("pop : ${route.settings.name ?? "null"}");
    super.didPop(route, previousRoute);
  }
}
