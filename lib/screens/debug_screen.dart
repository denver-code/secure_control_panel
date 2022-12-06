import 'package:flutter/material.dart';
import 'package:secure_control_panel/config.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        windowName: "Debug screen",
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 1.3,
        exitButtonCallback: () {
          Navigator.of(context).pop();
        },
        contentWidgetList: [],
        user: Config.guestOfflineUser);
  }
}
