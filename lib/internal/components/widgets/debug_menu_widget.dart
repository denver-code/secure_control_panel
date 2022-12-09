import 'package:flutter/material.dart';
import 'outline_button_widget.dart';

class DebugMenuWidget extends StatelessWidget {
  const DebugMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "FAST DEBUG MENU\nDEBUG: TRUE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              OutlineButtonComponent(
                gestureTapCallback: (() {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      "/authorisation", (route) => false);
                }),
                text: "AUTHORISATION",
                width: MediaQuery.of(context).size.width / 9,
                height: 34,
                fontSize: 13,
              ),
              const SizedBox(
                height: 5,
              ),
              OutlineButtonComponent(
                gestureTapCallback: (() {
                  Navigator.of(context).pushNamed("/debug");
                }),
                text: "DEBUG APP",
                width: MediaQuery.of(context).size.width / 9,
                height: 34,
                fontSize: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
