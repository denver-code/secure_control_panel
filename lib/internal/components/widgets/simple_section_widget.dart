import 'package:flutter/material.dart';

class SimpleScreenSectionWidget extends StatelessWidget {
  const SimpleScreenSectionWidget({
    Key? key,
    required this.sectionTitle,
    required this.sectionContent,
    required this.width,
  }) : super(key: key);
  final String sectionTitle;
  final List<Widget> sectionContent;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            sectionTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sectionContent,
          ),
        )
      ],
    );
  }
}
