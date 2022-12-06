import 'package:flutter/material.dart';

class UserInfoAlertWidget extends StatelessWidget {
  const UserInfoAlertWidget({Key? key, required this.user}) : super(key: key);
  final Map<String, Object> user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("User information"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: Write generator for that stuff
          Text("Username: ${user["username"]}"),
          Text("Department: ${user["department"]}"),
          Text("Access: ${user["access"]}"),
          Text("Family: ${user["family"]}"),
          Text("Type: ${user["type"]}"),
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
    );
  }
}
