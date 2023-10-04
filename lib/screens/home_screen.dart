import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/home_screen_texts.dart';
import 'package:summit_admin_app/controller/attendee_controller.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';
import 'package:summit_admin_app/respository/townscript_repo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String result = " ";
  late String count;

  @override
  Widget build(BuildContext context) {
    count = ref.watch(presentCountProvider).when(
          data: (count) => count.toString(),
          loading: () => "..",
          error: (e, s) => "?",
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IEDC-Summit",
          style: GoogleFonts.dmSans(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    HomeScreenText(text: 'Live Count: $count'),
                    const SizedBox(
                      height: 40,
                    ),
                    const HomeScreenText(text: 'Veg: 0'),
                    const SizedBox(
                      height: 40,
                    ),
                    const HomeScreenText(text: 'Non-Veg: 0'),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              HomeButton(
                title: "Event Registration",
                func: () {
                  Navigator.pushNamed(context, '/scanner');
                },
              ),
              const SizedBox(
                height: 40,
              ),
              HomeButton(
                title: "Workshops",
                func: () {},
              ),
              const SizedBox(
                height: 30,
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
      ),
    );
  }
}
