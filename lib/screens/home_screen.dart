import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';
import 'package:summit_admin_app/respository/townscript_repo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String result = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IEDC-Summit"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            HomeButton(
              title: "Event Attendence",
              func: () {
                Navigator.pushNamed(context, '/scanner');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            HomeButton(
              title: "Work shop Attendence",
              func: () {
                null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            HomeButton(
              title: "Upload firebase",
              func: () {
                TownscriptRepository(firestore: ref.watch(firestoreProvider))
                    .gettingData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
