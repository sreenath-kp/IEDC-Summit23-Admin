import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController cont;
  final String hintTxt;
  final TextInputType textInputType;

  const TextFieldInput({
    required this.cont,
    required this.hintTxt,
    required this.textInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: cont,
      decoration: InputDecoration(
          hintText: hintTxt,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 159, 159, 159),
          ),
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          border: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
    );
  }
}
