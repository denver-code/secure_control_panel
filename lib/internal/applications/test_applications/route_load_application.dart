import 'package:flutter/material.dart';
import 'package:secure_control_panel/config.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';
import 'package:secure_control_panel/internal/components/widgets/delimiter_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/simple_section_widget.dart';

import '../../components/widgets/outline_button_widget.dart';
import '../../components/widgets/text_field_widget.dart';

class AppManifest {
  static const Map details = {
    "name": "Route Loader",
    "version": "alpha v0.1.0+2",
    "developer": "Igor Savenko",
  };
}

class RouteLoaderApplication extends StatelessWidget {
  RouteLoaderApplication({Key? key}) : super(key: key);

  final List supportedRoutesList = Config.routes.keys.toList();
  final routerTextController = TextEditingController();
  final _user = Config.guestOfflineUser;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      user: _user,
      windowName: AppManifest.details["name"],
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 1.8,
      exitButtonCallback: () {
        Navigator.of(context).pop();
      },
      contentWidgetList: [
        SimpleScreenSectionWidget(
            width: MediaQuery.of(context).size.width / 1.6,
            sectionTitle: "Push Screen By Route",
            sectionContent: [
              const DelimiterWidget(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (() {
                  return List.generate(supportedRoutesList.length, (index) {
                    return Text(
                      supportedRoutesList[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    );
                  });
                }()),
              ),
            ]),
        const DelimiterWidget(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldWidget(
              letterSpacing: 1.0,
              width: MediaQuery.of(context).size.width / 6,
              height: 34,
              hintText: "Enter route",
              lenghtLimit: 100,
              textFieldController: routerTextController,
            ),
            OutlineButtonComponent(
                gestureTapCallback: () {
                  if (routerTextController.text.isEmpty ||
                      supportedRoutesList.contains(routerTextController.text) ==
                          false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please enter valid and exist route.")),
                    );
                  } else {
                    Navigator.of(context).pushNamed(routerTextController.text);
                  }
                },
                text: "OK",
                width: MediaQuery.of(context).size.width / 9,
                height: 34)
          ],
        ),
      ],
    );
  }
}
