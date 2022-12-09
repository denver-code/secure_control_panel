import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:secure_control_panel/config.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';
import 'package:secure_control_panel/internal/components/widgets/delimiter_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/simple_section_widget.dart';

import '../components/widgets/icon_grid_widget.dart';

class AppManifest {
  static const Map details = {
    "name": "Debug Tools",
    "version": "alpha v0.1.2+4",
    "developer": "Igor Savenko",
  };
}

class DebugApplication extends StatefulWidget {
  const DebugApplication({Key? key}) : super(key: key);

  @override
  State<DebugApplication> createState() => _DebugApplicationState();
}

class _DebugApplicationState extends State<DebugApplication> {
  final List _apps = Config.applicationList;
  final List _routes = Config.routes.keys.toList();
  late PackageInfo packageInfo;

  @override
  void initState() {
    super.initState();
    _getAppInfo();
  }

  _getAppInfo() async {
    PackageInfo pi = await PackageInfo.fromPlatform();
    packageInfo = pi; // I have no idea why but that line help
    setState(() {
      packageInfo = pi;
    });
  }

  @override
  Widget build(BuildContext context) {
    List appInfo = [
      "AppName: ${packageInfo.appName}",
      "PackageName: ${packageInfo.packageName}",
      "Version: ${packageInfo.version}",
      "BuildNumber: ${packageInfo.buildNumber}",
    ];

    return MainLayout(
        windowName: AppManifest.details["name"],
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 1.3,
        exitButtonCallback: () {
          Navigator.of(context).pop();
        },
        contentWidgetList: [
          SimpleScreenSectionWidget(
            width: MediaQuery.of(context).size.width / 1.6,
            sectionTitle: "Software Info",
            sectionContent: (() {
              return List.generate(appInfo.length, (index) {
                return Text(
                  appInfo[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                );
              });
            }()),
          ),
          SimpleScreenSectionWidget(
            width: MediaQuery.of(context).size.width / 1.6,
            sectionTitle: "Avaible Routes",
            sectionContent: (() {
              return List.generate(_routes.length, (index) {
                return Text(
                  "Route #$index - ${_routes[index]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                );
              });
            }()),
          ),
          SimpleScreenSectionWidget(
            width: MediaQuery.of(context).size.width / 1.6,
            sectionTitle: "Debug Application Details",
            sectionContent: [
              Text(
                "Name: ${AppManifest.details["name"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                "Version: ${AppManifest.details["version"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                "Developer: ${AppManifest.details["developer"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SimpleScreenSectionWidget(
            width: MediaQuery.of(context).size.width / 1.6,
            sectionTitle: "Test/Dev Applications",
            sectionContent: [
              const DelimiterWidget(height: 10),
              IconGridWidget(
                apps: _apps,
                columnIconCount: 3,
                isTestScreen: true,
              )
            ],
          ),
        ],
        user: Config.guestOfflineUser);
  }
}
