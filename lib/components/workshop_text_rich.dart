import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    required this.mainText,
    required this.subText,
  });

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: subText,
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: mainText,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              fontSize: 19,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
