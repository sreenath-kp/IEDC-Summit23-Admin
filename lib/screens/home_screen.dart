import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/home_screen_texts.dart';
import 'package:summit_admin_app/controller/attendee_controller.dart';
// import 'package:summit_admin_app/providers/firebase_providers.dart';
// import 'package:summit_admin_app/respository/townscript_repo.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: HomeScreenText(text: 'Live count :'),
                ),
                const SizedBox(width: 20),
                HomeScreenText(
                  text: count,
                )
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenText(text: 'Veg :'),
                    SizedBox(height: 6),
                    HomeScreenText(text: '97'),
                    SizedBox(height: 30),
                    HomeScreenText(text: 'Kit :'),
                    SizedBox(height: 6),
                    HomeScreenText(text: '98'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenText(text: 'Non Veg :'),
                    SizedBox(height: 6),
                    HomeScreenText(text: '99'),
                    SizedBox(height: 30),
                    HomeScreenText(text: 'No Kit :'),
                    SizedBox(height: 6),
                    HomeScreenText(text: '6000'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80),
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
              func: () {
                print(count);
                ;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            // HomeButton(
            //   title: "Upload firebase",
            //   func: () {
            //     TownscriptRepository(firestore: ref.watch(firestoreProvider))
            //         .gettingData();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
