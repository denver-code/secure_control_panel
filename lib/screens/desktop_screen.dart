import "package:flutter/material.dart";
import "package:secure_control_panel/config.dart";
import 'package:secure_control_panel/internal/components/widgets/desktop_icon_widget.dart';
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
        exitButtonCallback: () {},
        contentWidgetList: [
          IntrinsicHeight(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              height: MediaQuery.of(context).size.height / 1.3,
              // color: Colors.white30,
              child: GridView.count(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: (() {
                  return List.generate(_apps.length, (index) {
                    if (_apps[index]["isNotHidden"]) {
                      return DesktopIconWidget(
                        appName: _apps[index]["appName"] ?? "",
                        appRoute: _apps[index]["appRoute"] ?? "",
                        appIconText: _apps[index]["appIconText"] ?? "",
                      );
                    } else {
                      return Container();
                    }
                  });
                }()),
              ),
            ),
          ),
        ]);
  }
}
