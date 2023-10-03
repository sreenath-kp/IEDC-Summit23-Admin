import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';

final attendeeRepositoryProvider = Provider<AttendeeRepository>(
  (ref) {
    return AttendeeRepository(
      firestore: ref.watch(firestoreProvider),
    );
  },
);

class AttendeeRepository {
  final FirebaseFirestore _firestore;

  AttendeeRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _attendees => _firestore.collection('attendees');

  Stream<Attendee> getDatabyId(String id) {
    return _attendees.doc(id).snapshots().map(
          (event) => Attendee.fromMap(
            event.data() as Map<String, dynamic>,
          ),
        );
  }

  Future<bool> addAttendence(Attendee attendee) async {
    try {
      await _attendees.doc(attendee.iedcRegistrationNumber).update(
            attendee
                .copyWith(
                  isPresent: true,
                )
                .toMap(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}
