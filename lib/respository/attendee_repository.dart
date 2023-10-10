import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/constants/null_attendee.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';

final attendeeRepositoryProvider = Provider<AttendeeRepository>(
  (ref) {
    return AttendeeRepository(
      firestore: ref.watch(firestoreProvider),
    );
  },
);

final presentCountProvider = StreamProvider<int>(
  (ref) {
    return ref.watch(attendeeRepositoryProvider).getPresentCount();
  },
);

class AttendeeRepository {
  final FirebaseFirestore _firestore;

  AttendeeRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _attendees => _firestore.collection('attendees');
  // CollectionReference get _presentAttendees =>
  //     _firestore.collection('presentAttendees');

  Stream<Attendee> getDatabyId(String id) {
    try {
      return _attendees.doc(id).snapshots().map(
            (event) => Attendee.fromMap(
              event.data() as Map<String, dynamic>,
            ),
          );
    } catch (e) {
      return Stream.value(nullAttendee);
    }
  }

// get Present Count
  Stream<int> getPresentCount() {
    return _attendees.where("isPresent", isEqualTo: true).snapshots().map(
          (event) => event.docs.length,
        );
  }

// get Veg Count
  Stream<int> getVegCount() {
    return _attendees
        .where("isPresent", isEqualTo: true)
        .where("foodPreference", isEqualTo: "Veg")
        .snapshots()
        .map(
          (event) => event.docs.length,
        );
  }

// get Non Veg Count
  Stream<int> getNonVegCount() {
    return _attendees
        .where("isPresent", isEqualTo: true)
        .where("foodPreference", isEqualTo: "Non-veg")
        .snapshots()
        .map(
          (event) => event.docs.length,
        );
  }

  Future<bool> addAttendence(Attendee attendee) async {
    try {
      await _attendees.doc(attendee.iedcRegistrationNumber).update(
            attendee.copyWith(isPresent: true).toMap(),
          );
      // await _presentAttendees
      //     .doc(attendee.iedcRegistrationNumber)
      //     .set(attendee.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

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
}
