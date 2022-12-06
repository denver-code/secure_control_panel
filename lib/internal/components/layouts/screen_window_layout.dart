import 'package:flutter/material.dart';

class ScreenWindowLayout extends StatelessWidget {
  const ScreenWindowLayout({
    Key? key,
    this.windowName = "New window",
    required this.width,
    required this.height,
    required this.contentWidgetList,
    this.internalBodyPadding = const EdgeInsets.all(30),
    required this.exitButtonCallback,
  }) : super(key: key);
  final String windowName;
  final double width;
  final double height;
  final GestureTapCallback exitButtonCallback;
  final List<Widget> contentWidgetList;
  final EdgeInsets internalBodyPadding;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
            width: 2,
          )),
          child: Column(
            children: [
              Container(
                width: width,
                height: 25,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        windowName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: exitButtonCallback,
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "X",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: internalBodyPadding,
                child: Column(
                  children: contentWidgetList,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
