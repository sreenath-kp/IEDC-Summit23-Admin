import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/controller/workshop_controller.dart';

class WorkshopAttendeeListScreen extends ConsumerWidget {
  final String workshopName;
  const WorkshopAttendeeListScreen({super.key, required this.workshopName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendees',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        actions: [
          // TODO: Implement export to CSV - optional
          TextButton(
            onPressed: () {},
            child: const Text(
              'Export to CSV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ref.watch(workshopAttendeesProvider(workshopName)).when(
                data: (attendees) => Expanded(
                  child: ListView.builder(
                    itemCount: attendees.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.only(left: 40),
                      title: Text(
                        attendees[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                loading: () => const Loader(),
                error: (error, stackTrace) => const Center(
                  child: Text('Error fetching attendees'),
                ),
              )
        ],
      ),
    );
  }
}
