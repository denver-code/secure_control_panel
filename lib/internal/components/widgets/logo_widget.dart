import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Secure Control Panel",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        Container(
          // alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Padding(
            padding: EdgeInsets.only(left: 9.0, right: 9.0, top: 3),
            child: Text(
              "DENSEC SOLUTION",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
