import 'package:flutter/material.dart';

class SuravNavigate {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();
}

NavigatorState navigate = SuravNavigate.navigateKey.currentState!;
BuildContext currentContext = SuravNavigate.navigateKey.currentContext!;
MaterialPageRoute routeMe(Widget Screen) {
  return MaterialPageRoute(builder: (context) {
    return Screen;
  });
}
