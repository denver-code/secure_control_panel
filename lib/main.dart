import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:secure_control_panel/screens/authorisation_screen.dart';
import 'package:secure_control_panel/screens/debug_screen.dart';
import 'package:secure_control_panel/screens/desktop_screen.dart';

import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Size size = await DesktopWindow.getWindowSize();
  DesktopWindow.setMinWindowSize(size);
  DesktopWindow.setMaxWindowSize(size);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Control Panel',
      debugShowCheckedModeBanner: Config.kDebugMode,
      theme: ThemeData(
        fontFamily: "MacPawFixel",
        primarySwatch: Colors.orange,
      ),
      home: const AuthorisationScreen(),
      initialRoute: "/authorisationScreen",
      routes: {
        "/authorisationScreen": (_) => const AuthorisationScreen(),
        "/desktop": (_) => const DesktopScreen(),
        "/debug": (_) => const DebugScreen()
      },
    );
  }
}
