import "package:flutter/material.dart";
import "package:secure_control_panel/config.dart";
import 'package:secure_control_panel/internal/components/widgets/icon_grid_widget.dart';
import '../internal/components/layouts/main_layout.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  final _user = Config.guestOfflineUser;
  final _apps = Config.applicationList;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        user: _user,
        windowName: "Desktop",
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 1.3,
        exitButtonCallback: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/authorisation", (route) => false);
        },
        contentWidgetList: [IconGridWidget(apps: _apps)]);
  }
}
