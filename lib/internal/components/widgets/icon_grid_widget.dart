import 'package:flutter/material.dart';

import 'desktop_icon_widget.dart';

class IconGridWidget extends StatelessWidget {
  const IconGridWidget({
    Key? key,
    required this.apps,
    this.columnIconCount = 7,
    this.isTestScreen = false,
  }) : super(key: key);
  final List apps;
  final int columnIconCount;
  final bool isTestScreen;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 1.3,
        child: GridView.count(
          crossAxisCount: columnIconCount,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: (() {
            return List.generate(apps.length, (index) {
              switch (isTestScreen) {
                case false:
                  if (apps[index]["isNotHidden"] && apps[index]["isNotTest"]) {
                    return DesktopIconWidget(
                      appName: apps[index]["details"]["name"] ?? "",
                      appRoute: apps[index]["appRoute"] ?? "",
                      appIconText: apps[index]["appIconText"] ?? "",
                    );
                  } else {
                    return Container();
                  }
                case true:
                  if (apps[index]["isNotTest"] == false) {
                    return DesktopIconWidget(
                      appName: apps[index]["appName"] ?? "",
                      appRoute: apps[index]["appRoute"] ?? "",
                      appIconText: apps[index]["appIconText"] ?? "",
                    );
                  } else {
                    return Container();
                  }
                default:
                  return Container();
              }
            });
          }()),
        ),
      ),
    );
  }
}
