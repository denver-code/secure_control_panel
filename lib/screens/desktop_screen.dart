import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:secure_control_panel/config.dart";
import 'package:secure_control_panel/internal/components/widgets/debug_menu_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/outline_button_widget.dart';
import "package:secure_control_panel/internal/services/hex2color.dart";

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  final _user = Config.guestOfflineUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
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
                              const Text(
                                "Desktop",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // ignore: avoid_print
                                  print("BOOOOM!");
                                },
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
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: const [],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "username: ${_user["username"]}\ndepartment: ${_user["department"]}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OutlineButtonComponent(
                        gestureTapCallback: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text("User information"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // TODO: Write generator for that stuff
                                Text("Username: ${_user["username"]}"),
                                Text("Department: ${_user["department"]}"),
                                Text("Access: ${_user["access"]}"),
                                Text("Family: ${_user["family"]}"),
                                Text("Type: ${_user["type"]}"),
                                const Text("Permissions: coming soon..")
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, "OK"),
                                child: const Text(
                                  "OK",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        text: "SHOW DETAILS",
                        width: MediaQuery.of(context).size.width / 9,
                        height: 34,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (() {
              if (Config.kDebugMode) {
                return const DebugMenuWidget();
              } else {
                return Container();
              }
            }())
          ],
        )),
        bottomNavigationBar: Container(
            alignment: Alignment.centerRight,
            height: 27,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: HexColor.fromHex("#414141")),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 27,
                  width: 2.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "OFFLINE - HAVE NO SERVER CONNECTION",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            )));
  }
}
