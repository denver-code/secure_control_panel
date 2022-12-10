import 'package:flutter/material.dart';
import 'package:secure_control_panel/internal/applications/applications_overview_application.dart'
    as applications_app;
import 'package:secure_control_panel/screens/authorisation_screen.dart';
import 'package:secure_control_panel/screens/desktop_screen.dart';

import 'internal/applications/debug_application.dart' as debug_app;
import 'internal/applications/test_applications/route_load_application.dart'
    as route_load;

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
      "isNotTest": true,
      "details": debug_app.AppManifest.details
    },
    {
      "appName": "Route Loader",
      "appRoute": "/routeLoad",
      "appIconText": "R",
      "isNotHidden": true,
      "isNotTest": false,
      "details": route_load.AppManifest.details
    },
    {
      "appName": "Applications",
      "appRoute": "/applicationsOverview",
      "appIconText": "A",
      "isNotHidden": true,
      "isNotTest": true,
      "details": applications_app.AppManifest.details
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    "/authorisation": (_) => const AuthorisationScreen(),
    "/desktop": (_) => const DesktopScreen(),
    "/debug": (_) => const debug_app.DebugApplication(),
    "/routeLoad": (_) => route_load.RouteLoaderApplication(),
    "/applicationsOverview": (_) =>
        const applications_app.ApplicationsOverviewApplication()
  };
}
