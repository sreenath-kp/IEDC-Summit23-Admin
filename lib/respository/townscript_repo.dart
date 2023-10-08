import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
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
          .set(attendee.toMap());
      print("success");
    } catch (e) {
      print("failed to upload");
    }
  }

  Future<void> getDataFromCSV() async {
    final _rawData = await rootBundle.loadString("assets/event_data.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    // final fields = await input
    //     .transform(utf8.decoder)
    //     .transform(const CsvToListConverter())
    //     .toList();
    print(_listData[0]);
    print(_listData[1]);

    // [
    // 0 Registration Id,
    // 1 Attendee Name,
    // 2 Attendee Email,
    // 3 Status,
    // 4 Ticket_Name,
    // 5 Order_Id,
    // 6 Gender,
    // 7 Mobile Number (Whatsapp no preferred),
    // 8 Name of the Organisation,
    // 9 Designation,
    // 10 Attendee category,
    // 11 My college has IEDC,
    // 12 Name of Academic Institution,
    // 13 IEDC Code,
    // 14 Address,
    // 15 Attendee category,
    // 16 If other,
    // 17 mention category,
    // 18 Food preference,
    // 19 Emergency contact,
    // 20 District of residence,
    // 21 Other district (Please specify),
    // 22 Campus Ambassador Referral ID,
    // 23 Attendee Check-In,
    // 24 Check-In Time,
    // 25 Attendee Badge Print,
    // 26 Badge Print Time,];
    for (var i = 1; i < _listData.length; i++) {
      Attendee attendee = Attendee(
        name: _listData[i][1].toString(),
        email: _listData[i][2].toString(),
        mobile: _listData[i][7].toString(),
        gender: _listData[i][6].toString(),
        attendeeCategory: _listData[i][10].toString(),
        collegeHasIEDC: _listData[i][11].toString(),
        address: _listData[i][14].toString(),
        foodPreference: _listData[i][17].toString(),
        emergencyContact: _listData[i][18].toString(),
        districtOfResidence: _listData[i][19].toString(),
        iedcRegistrationType: _listData[i][4].toString(),
        iedcRegistrationNumber: _listData[i][0].toString(),
        isPresent: false,
      );
      uploadtoFirebase(attendee);
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
