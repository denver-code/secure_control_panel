import 'package:flutter/material.dart';

import '../../services/hex2color.dart';

class BottomNavbarLayout extends StatelessWidget {
  const BottomNavbarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
    );
  }
}
