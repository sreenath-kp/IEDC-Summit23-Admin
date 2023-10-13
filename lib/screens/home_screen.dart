import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/home_screen_texts.dart';
import 'package:summit_admin_app/controller/attendee_controller.dart';
import 'package:summit_admin_app/respository/workshop_repository.dart';
// import 'package:summit_admin_app/providers/firebase_providers.dart';
// import 'package:summit_admin_app/respository/sanity_repo.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String result = " ";
  late String count;
  late String vegCount;
  late String nonVegCount;

  @override
  Widget build(BuildContext context) {
    count = ref.watch(presentCountProvider).when(
          data: (count) => count.toString(),
          loading: () => "..",
          error: (e, s) => "?",
        );
    vegCount = ref.watch(vegCountProvider).when(
          data: (count) => count.toString(),
          loading: () => "..",
          error: (e, s) => "?",
        );
    nonVegCount = ref.watch(nonVegCountProvider).when(
          data: (count) => count.toString(),
          loading: () => "..",
          error: (e, s) => "?",
        );
    return Scaffold(
      appBar: homeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    HomeScreenText(text: 'Live Count: $count'),
                    const SizedBox(
                      height: 40,
                    ),
                    HomeScreenText(text: 'Veg: $vegCount'),
                    const SizedBox(
                      height: 40,
                    ),
                    HomeScreenText(text: 'Non-Veg: $nonVegCount'),
                  ],
                ),
              ),
              // HomeButton(
              //   title: "Event Registration",
              //   func: () {
              //     Navigator.pushNamed(context, '/eventScanner');
              //   },
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              // HomeButton(
              //   title: "Workshops",
              //   func: () async {
              //     Navigator.pushNamed(context, '/workshopsList');
              //   },
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              HomeButton(
                title: "create csv",
                func: () {
                  ref
                      .watch(workshopRepositoryProvider)
                      .printAttendeesForWorkshops();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homeScreenAppBar() {
    return AppBar(
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
    );
  }
}
