import 'package:flutter/material.dart';
import 'package:secure_control_panel/internal/components/widgets/user_info_alert_widget.dart';

import 'outline_button_widget.dart';

class UserOnScreenTextWidget extends StatelessWidget {
  const UserOnScreenTextWidget({Key? key, required this.user})
      : super(key: key);
  final user;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "username: ${user["username"]}\ndepartment: ${user["department"]}",
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
                    builder: (BuildContext context) =>
                        UserInfoAlertWidget(user: user)),
                text: "SHOW DETAILS",
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
