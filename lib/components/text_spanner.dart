import 'package:flutter/material.dart';

class TextSpanner extends StatelessWidget {
  final String title;
  final String subtitile;
  const TextSpanner({super.key, required this.title, required this.subtitile});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontFamily: 'DM Sans',
      fontWeight: FontWeight.w400,
      height: 0,
    );
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: textStyle),
          TextSpan(
            text: subtitile,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
