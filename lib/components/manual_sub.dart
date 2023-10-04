import 'package:flutter/material.dart';

class ManualSub extends StatelessWidget {
  final TextEditingController controller;
  const ManualSub({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter text here',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
