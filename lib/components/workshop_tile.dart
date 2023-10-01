import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkshopTile extends ConsumerWidget {
  const WorkshopTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(
        Icons.cast_for_education,
        size: 10,
      ),
      title: Column(
        children: [
          Text("WorkShop Name"),
        ],
      ),
    );
  }
}
