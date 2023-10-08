import 'package:flutter/material.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/screens/workshop.dart';
import 'package:summit_admin_app/theme/pallete.dart';

class WorkshopsListScreen extends StatelessWidget {
  const WorkshopsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Workshop> workshops = dummyWorkshops;

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
          Expanded(
            child: ListView.builder(
              itemCount: workshops.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: const EdgeInsets.only(left: 40),
                title: Text(
                  workshops[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => WorkshopScreen(
                  //       workshop: workshops[index],
                  //     ),
                  //   ),
                  // );
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
        ],
      ),
    );
  }
}
