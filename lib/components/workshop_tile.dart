import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/theme/pallete.dart';

class WorkshopTile extends ConsumerWidget {
  const WorkshopTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
      child: const ListTile(
        leading: Icon(
          Icons.cast_for_education,
          size: 30,
        ),
        title: Text("WorkShop Name"),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Venue"),
            Text("09 : 30"),
          ],
        ),
      ),
    );
  }
}
