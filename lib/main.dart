import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:secure_control_panel/screens/authorisation_screen.dart';

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
      routes: Config.routes,
    );
  }
}
