import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summit_admin_app/constants/secret.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:http/http.dart' as http;

class SanityRepo {
  final FirebaseFirestore _firestore;
  SanityRepo({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  Future<void> uploadtoFirebase(Workshop workshop) async {
    // upload data to firebase
    try {
      await _firestore
          .collection('workshops')
          .doc(workshop.title)
          .set(workshop.toMap());
      print("workshops success");
    } catch (e) {
      print("failed to upload");
    }
  }

  Future<void> gettingData() async {
    // get data from sanity
    final response = await http.get(
      Uri.parse(
          'https://i0p2y232.api.sanity.io/v2021-06-07/data/query/production?query=*[_type == "event"]{_id,event_name,start_time,end_time,speaker,status,category,venue,posterurl,maxcount}'),
      headers: sanityHeader,
    );
    var sanityData = jsonDecode(response.body)['result'];
    Workshop workshop;
    for (var data in sanityData) {
      workshop = Workshop(
        title: data['event_name'],
        startTime: data['start_time'],
        endTime: data['end_time'],
        speaker: data['speaker'],
        description: data['status'],
        posterUrl: data["posterurl"],
        venue: data["venue"],
        attendees: [],
        preregistered: [],
        max: data["maxcount"],
      );
      // uploadtoFirebase(workshop);
    }
  }
}
