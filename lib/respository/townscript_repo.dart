import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:summit_admin_app/constants/secret.dart';
import 'package:summit_admin_app/models/attendee_model.dart';

class TownscriptRepository {
  final FirebaseFirestore _firestore;
  TownscriptRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  Future<void> uploadtoFirebase(Attendee attendee) async {
    try {
      await _firestore
          .collection('attendees')
          .doc(attendee.iedcRegistrationNumber)
          .set(
            attendee.toMap(),
          );
      print("success");
    } catch (e) {
      print("failed to upload");
    }
  }

  Future<void> gettingData() async {
    final response = await http.get(
      Uri.parse(
        'https://www.townscript.com/api/registration/getRegisteredUsers?eventCode=-iedc-summit-demo-113112',
      ),
      headers: requestHeaders,
    );
    var townScriptData = jsonDecode(response.body)["data"];
    var decodedData = jsonDecode(townScriptData);
    Attendee attendee;
    for (var data in decodedData) {
      attendee = Attendee(
        name: data["userName"],
        email: data["userEmailId"],
        mobile: data["answerList"][1]["answer"],
        gender: data["answerList"][0]["answer"],
        attendeeCategory: data["answerList"][2]["answer"],
        collegeHasIEDC: data["answerList"][3]["answer"],
        address: data["answerList"][4]["answer"],
        foodPreference: data["answerList"][5]["answer"],
        emergencyContact: data["answerList"][6]["answer"],
        districtOfResidence: data["answerList"][7]["answer"],
        iedcRegistrationType: data["allTicketName"],
        iedcRegistrationNumber: data["registrationId"].toString(),
        isPresent: false,
      );
      uploadtoFirebase(attendee);
    }
  }
}

// Gender
// Male

// Mobile Number (Whatsapp no preferred)
// +911425367894

// Attendee category
// Student

// My college has IEDC
// No

// Address
// Trivandrum

// Food preference
// Veg

// Emergency contact
// +911234567890

// District of residence
// Kannur

// Rahul Das P
// tve21cs109@cet.ac.in

// IEDC Registration
// INR

// 11854457
