import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:secure_control_panel/config.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
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
        windowName: "Debug screen",
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 1.3,
        exitButtonCallback: () {
          Navigator.of(context).pop();
        },
        contentWidgetList: [
          const Center(
            child: Text(
              "Application Info",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (() {
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
          ),
          const Center(
            child: Text(
              "Avaible Routes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (() {
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
          )
        ],
        user: Config.guestOfflineUser);
  }
}
