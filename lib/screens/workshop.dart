import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summit_admin_app/components/workshop_text_rich.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/screens/spot_admit_screen.dart';
import 'package:summit_admin_app/screens/workshop_scanner.dart';
import 'package:summit_admin_app/screens/workshop_attendees_screen.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key, required this.workshop});
  final Workshop workshop;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Padding(
            // TODO: tweek
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    textAlign: TextAlign.center,
                    workshop.title,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ), //Textstyle
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.network(
                        "https://cdn.sanity.io/images/85e4z8hj/production/44b38df421a37ea5396674058e7f1fb9c346e9d6-1600x1600.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ), //CircleAvatar
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRich(
                      mainText: workshop.venue,
                      subText: 'Venue : ',
                    ),
                    TextRich(
                      mainText:
                          '${workshop.startTime.substring(11, 16)} - ${workshop.endTime.substring(11, 16)}',
                      subText: 'Time : ',
                    ),
                    TextRich(
                      mainText: workshop.speaker,
                      subText: 'Speaker : ',
                    ),
                  ],
                ),
                ButtonBar(
                  buttonPadding: const EdgeInsets.all(2),
                  overflowDirection: VerticalDirection.down,
                  alignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    WorkshopAttendeeListScreen(
                                  workshopName: workshop.title,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Attendees List',
                            style: GoogleFonts.dmSans(
                              color: Colors.amber,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WorkshopScannerScreen(
                                    wsName: workshop.title),
                              ),
                            );
                          },
                          child: Text(
                            'Add Participant',
                            style: GoogleFonts.dmSans(
                              color: Colors.amber,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SpotAdmitScreen(wsName: workshop.title),
                          ),
                        );
                      },
                      child: Text(
                        'Spot Admission',
                        style: GoogleFonts.dmSans(
                          color: Colors.amber,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
