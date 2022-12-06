import 'package:flutter/material.dart';
import 'package:secure_control_panel/internal/components/layouts/bottom_navbar_layout.dart';
import 'package:secure_control_panel/internal/components/layouts/screen_window_layout.dart';
import 'package:secure_control_panel/internal/components/widgets/user_info_alert_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/user_on_screen_text_widget.dart';

import '../../../config.dart';
import '../widgets/debug_menu_widget.dart';
import '../widgets/outline_button_widget.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {Key? key,
      this.isAllowedToShowDebugMenu = true,
      this.windowName = "New window",
      required this.width,
      required this.height,
      required this.exitButtonCallback,
      required this.contentWidgetList,
      this.internalBodyPadding = const EdgeInsets.all(30),
      this.user = const {}})
      : super(key: key);
  final bool isAllowedToShowDebugMenu;
  final String windowName;
  final double width;
  final double height;
  final GestureTapCallback exitButtonCallback;
  final List<Widget> contentWidgetList;
  final EdgeInsets internalBodyPadding;
  final Map<String, Object> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            ScreenWindowLayout(
              windowName: windowName,
              width: width,
              height: height,
              exitButtonCallback: exitButtonCallback,
              contentWidgetList: contentWidgetList,
              internalBodyPadding: internalBodyPadding,
            ),
            (() {
              if (user.isNotEmpty) {
                return UserOnScreenTextWidget(user: user);
              } else {
                return Container();
              }
            }()),
            (() {
              if (Config.kDebugMode && isAllowedToShowDebugMenu) {
                return const DebugMenuWidget();
              } else {
                return Container();
              }
            }())
          ],
        )),
        bottomNavigationBar: const BottomNavbarLayout());
  }
}
