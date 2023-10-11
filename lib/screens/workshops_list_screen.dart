import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/controller/workshop_controller.dart';
import 'package:summit_admin_app/screens/search_delegate.dart';
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
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWorkShopsDelegate(ref: ref),
              );
            },
            icon: const Icon(
              Icons.search,
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
                        trailing: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                          child: Text(
                            "${workshops[index].max}/${workshops[index].attendees.length}",
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
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
              error: (error, stackTrace) {
                return const ScaffoldMessenger(child: Text("error"));
              },
              loading: () => const Loader())
        ],
      ),
    );
  }
}
