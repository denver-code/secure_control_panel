import 'package:flutter/material.dart';

import 'delimiter_widget.dart';

class DesktopIconWidget extends StatelessWidget {
  const DesktopIconWidget(
      {Key? key,
      required this.appName,
      required this.appRoute,
      required this.appIconText})
      : super(key: key);
  final String appName;
  final String appRoute;
  final String appIconText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(appRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  appIconText,
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            const DelimiterWidget(height: 7),
            Text(
              appName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
