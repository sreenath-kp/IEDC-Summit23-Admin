import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summit_admin_app/components/workshop_text_rich.dart';
import 'package:summit_admin_app/models/workshop_model.dart';

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
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  workshop.title,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Colors.white,
                  ), //Textstyle
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 200,
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
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Attendees List',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add Participant',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
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
