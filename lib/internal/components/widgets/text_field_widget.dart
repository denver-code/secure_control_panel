import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.letterSpacing,
    required this.width,
    required this.height,
    required this.hintText,
    required this.lenghtLimit,
    required this.textFieldController,
  }) : super(key: key);
  final double letterSpacing;
  final double width;
  final double height;
  final String hintText;
  final int lenghtLimit;
  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextFormField(
        controller: textFieldController,
        style: TextStyle(letterSpacing: letterSpacing, color: Colors.white),
        inputFormatters: [
          LengthLimitingTextInputFormatter(lenghtLimit),
        ],
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 2, color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 2, color: Colors.white),
          ),
          focusColor: Colors.white,
          hintText: hintText, // pass the hint text parameter here
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
