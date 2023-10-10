import 'package:flutter/material.dart';

class WSManualSub extends StatelessWidget {
  final TextEditingController controller;
  final String wsName;
  final Function(String id, String wsName) func;
  const WSManualSub({
    Key? key,
    required this.controller,
    required this.wsName,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 15, 15, 15),
              hintText: 'Enter Ticket ID',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // Unfocus keyboard before popping dialog and navigating
            FocusScope.of(context).unfocus();
            Navigator.pop(context);
            if (controller.text.isNotEmpty) {
              func(controller.text, wsName);
            }
          },
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.arrow_forward,
          ),
        ),
      ],
    );
  }
}
