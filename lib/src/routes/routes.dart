import 'package:flutter/material.dart';

class Routes {
  static void goToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }

  static void goToChatDetail(BuildContext context) {
    Navigator.pushNamed(context, '/chatDetail');
  }

  static void goToProfile(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
