import 'package:flutter/material.dart';

class TheTick extends StatelessWidget {
  const TheTick({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 10, 10, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
