import 'package:flutter/material.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';
import 'package:secure_control_panel/internal/components/widgets/delimiter_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/simple_section_widget.dart';

import '../../config.dart';

class AppManifest {
  static const Map details = {
    "name": "Applications",
    "version": "alpha v0.0.1+1",
    "developer": "Igor Savenko",
  };
}

class ApplicationsOverviewApplication extends StatelessWidget {
  const ApplicationsOverviewApplication({Key? key}) : super(key: key);

  final _user = Config.guestOfflineUser;
  final _apps = Config.applicationList;

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
              sectionTitle: "Applications installed in system",
              sectionContent: [
                const DelimiterWidget(height: 25),
                Column(
                  children: (() {
                    return List.generate(_apps.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.2),
                                  child: Text(
                                    _apps[index]["appIconText"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _apps[index]["details"]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                          const DelimiterWidget(height: 7),
                          // TODO: Make Text Builder
                          Text(
                            "Version: ${_apps[index]["details"]["version"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Developer: ${_apps[index]["details"]["developer"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "App Route: ${_apps[index]["appRoute"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "App Icon Text: ${_apps[index]["appIconText"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Is Not Hidden: ${_apps[index]["isNotHidden"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Is Not Test: ${_apps[index]["isNotTest"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          const DelimiterWidget(height: 20)
                        ],
                      );
                    });
                  }()),
                )
              ],
              width: MediaQuery.of(context).size.width / 3)
        ]);
  }
}
