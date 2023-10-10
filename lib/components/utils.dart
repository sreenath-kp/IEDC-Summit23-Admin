import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Center(
          child: Text(
            msg,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
}
