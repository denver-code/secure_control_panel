import 'package:flutter/material.dart';
import 'package:secure_control_panel/screens/authorisation_screen.dart';
import 'package:secure_control_panel/screens/debug_screen.dart';
import 'package:secure_control_panel/screens/desktop_screen.dart';

class Config {
  static const kDebugMode = true;

  // TODO: Add models/schemas and generator
  static const guestOfflineUser = {
    "username": "guest_offline_root",
    "department": "Cyber Security Unit",
    "password": "",
    "access": "666",
    "family": "root",
    "type": "offline",
    "permissions": [
      "OFFLINE_AUTHORISATION",
    ]
  };

  static const List applicationList = [
    {
      "appName": "Debug App",
      "appRoute": "/debug",
      "appIconText": "D",
      "isNotHidden": kDebugMode,
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    "/authorisationScreen": (_) => const AuthorisationScreen(),
    "/desktop": (_) => const DesktopScreen(),
    "/debug": (_) => const DebugScreen()
  };
}
