import 'package:flutter/material.dart';

class HomeScreenText extends StatelessWidget {
  final String text;
  const HomeScreenText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}
