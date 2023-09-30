import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';
import 'package:summit_admin_app/respository/townscript_repo.dart';

class AdmitTile extends ConsumerWidget {
  final String barId;

  const AdmitTile({super.key, required this.barId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: ListTile(
        horizontalTitleGap: 8,
        leading: const SizedBox(
          height: 10,
          width: 20,
          child: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.verified, fill: 1.0),
          ),
        ),
        title: const Text(
          "Student name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          barId,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.done,
            color: Colors.greenAccent,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
