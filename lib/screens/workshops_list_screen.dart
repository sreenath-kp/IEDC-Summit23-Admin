import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/controller/workshop_controller.dart';
import 'package:summit_admin_app/screens/workshop.dart';
import 'package:summit_admin_app/theme/pallete.dart';

class WorkshopsListScreen extends ConsumerWidget {
  const WorkshopsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workshops',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ref.watch(workshopsProvider).when(
              data: (workshops) => Expanded(
                    child: ListView.builder(
                      itemCount: workshops.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.only(left: 40),
                        title: Text(
                          workshops[index].title,
                          style: const TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => WorkshopScreen(
                              workshop: workshops[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              error: (error, stackTrace) =>
                  const ScaffoldMessenger(child: Text('Error')),
              loading: () => const Loader())
        ],
      ),
    );
  }
}
