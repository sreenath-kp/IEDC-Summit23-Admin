import 'dart:async';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';
import 'package:summit_admin_app/respository/attendee_repository.dart';

class Ws {
  final String wsName;
  final String id;

  Ws({required this.wsName, required this.id});
}

final workshopRepositoryProvider = Provider<WorkshopRepository>(
  (ref) {
    return WorkshopRepository(
      firestore: ref.watch(firestoreProvider),
    );
  },
);

final isIDPresentInWorkshopProvider = FutureProvider.family(
  (ref, Ws ws) async {
    return ref.watch(workshopRepositoryProvider).isIDPresentInWorkshop(
          ws.id,
          ws.wsName,
        );
  },
);

class WorkshopRepository {
  final FirebaseFirestore _firestore;
  WorkshopRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _workshops => _firestore.collection('workshops');

  Stream<List<Workshop>> getWorkshops() {
    return _workshops.snapshots().map(
          (event) => event.docs.map(
            (e) {
              Workshop workshop = Workshop.fromMap(
                e.data() as Map<String, dynamic>,
              );
              return workshop;
            },
          ).toList(),
        );
  }

  Stream<List<Workshop>> getWorkshopsByName(String query) {
    return _workshops
        .where(
          "title",
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map(
      (event) {
        List<Workshop> communities = [];
        for (var community in event.docs) {
          communities.add(
            Workshop.fromMap(community.data() as Map<String, dynamic>),
          );
        }
        return communities;
      },
    );
  }

  Future<void> addWorkshopAttendence(String wsName, String id) async {
    try {
      await _workshops.doc(wsName).update(
        {
          "attendees": FieldValue.arrayUnion([id])
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> isIDPresentInWorkshop(String id, String wsName) async {
    try {
      final wsDoc = await _workshops.doc(wsName).get();
      final Workshop workshop =
          Workshop.fromMap(wsDoc.data()! as Map<String, dynamic>);
      // print(workshop.attendees);
      bool result = workshop.attendees.contains(id);
      return result;
    } catch (e) {
      return false;
    }
  }

  Stream<List<String>> getWorkshopAttendees(String workshopName) {
    return _workshops.doc(workshopName).snapshots().map((event) =>
        Workshop.fromMap(event.data() as Map<String, dynamic>).attendees);
  }

  Future<void> createCSV() async {
    List<String> attendees = [];
    await _workshops.doc().snapshots().map(
      (event) {
        attendees =
            (Workshop.fromMap(event.data() as Map<String, dynamic>).attendees);
        print(attendees);
      },
    );
  }

  Future<void> printAttendeesForWorkshops() async {
    // Replace "workshopCollectionRef" with your Firestore collection reference to workshops.
    final workshopCollectionRef =
        FirebaseFirestore.instance.collection('workshops');

    final workshops = await workshopCollectionRef.get();

    for (final workshop in workshops.docs) {
      print('Workshop: ${workshop.id}');
      List<String> attendees = [];
      attendees = (Workshop.fromMap(workshop.data()).attendees);
      List<List<dynamic>> rows = [];
      List<dynamic> row = [];
      row.add("Name");
      row.add("Attendee_category");
      row.add("CollegeHasIEDC");
      row.add("Email");
      row.add("Mobile");
      row.add("Gender");
      row.add("Address");
      row.add("EmergencyContact");
      row.add("District of Residence");
      rows.add(row);

      for (final attendee in attendees) {
        final ticketID = attendee.split("*")[0];
        await _firestore.collection('attendees').doc(ticketID).snapshots().map(
          (event) {
            Attendee att = Attendee.fromMap(
              event.data() as Map<String, dynamic>,
            );
            List<dynamic> row = [];
            row.add(att.name);
            row.add(att.attendeeCategory);
            row.add(att.collegeHasIEDC);
            row.add(att.email);
            row.add(att.mobile);
            row.add(att.gender);
            row.add(att.address);
            row.add(att.emergencyContact);
            row.add(att.districtOfResidence);
            rows.add(row);
          },
        );
      }
      String csv = const ListToCsvConverter().convert(rows);
    }
  }
}
