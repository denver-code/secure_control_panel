import 'package:flutter/material.dart';
import 'package:secure_control_panel/internal/components/layouts/main_layout.dart';
import 'package:secure_control_panel/internal/components/widgets/delimiter_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/logo_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/outline_button_widget.dart';
import 'package:secure_control_panel/internal/components/widgets/text_field_widget.dart';

class AuthorisationScreen extends StatelessWidget {
  const AuthorisationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        windowName: "Authorisation",
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 1.8,
        exitButtonCallback: () {},
        contentWidgetList: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "SCP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                "SecurePanel", //tryzub
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const DelimiterWidget(height: 20),
          const Text("Please enter your User Authentication Code",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),
          const DelimiterWidget(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWidget(
                  letterSpacing: 6.0,
                  width: MediaQuery.of(context).size.width / 6,
                  height: 34,
                  hintText: "Unique UAC",
                  lenghtLimit: 9),
              OutlineButtonComponent(
                  gestureTapCallback: () {},
                  text: "OK",
                  width: MediaQuery.of(context).size.width / 9,
                  height: 34)
            ],
          ),
          const DelimiterWidget(height: 25),
          OutlineButtonComponent(
              gestureTapCallback: (() {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/desktop", (route) => false);
              }),
              text: "CONTINUE OFFLINE",
              width: MediaQuery.of(context).size.width / 6,
              height: 34),
          const DelimiterWidget(height: 40),
          const LogoWidget()
        ]);
  }
}
