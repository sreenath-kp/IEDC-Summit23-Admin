import 'package:flutter/material.dart';
import 'package:summit_admin_app/theme/pallete.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback func;
  const HomeButton({super.key, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Pallete.greyColor,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.green, offset: Offset(2, 2))
        ],
      ),
      child: TextButton(
        onPressed: func,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
