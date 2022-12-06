import 'package:flutter/material.dart';

class OutlineButtonComponent extends StatelessWidget {
  const OutlineButtonComponent({
    Key? key,
    required this.gestureTapCallback,
    required this.text,
    required this.width,
    required this.height,
    this.letterSpacing = 2.0,
    this.fontSize = 17,
  }) : super(key: key);
  final GestureTapCallback gestureTapCallback;
  final String text;
  final double width;
  final double height;
  final double letterSpacing;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureTapCallback,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}
