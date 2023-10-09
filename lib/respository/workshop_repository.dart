import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';

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
          (event) => event.docs
              .map(
                (e) => Workshop.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Future<void> addWorkshopAttendence(String wsName, String id) async {
    try {
      await _workshops.doc(wsName).update(
        {
          "attendees": FieldValue.arrayUnion([id])
        },
      );
    } catch (e) {}
  }

  Future<bool> isIDPresentInWorkshop(String id, String wsName) async {
    try {
      final wsDoc = await _workshops.doc(wsName).get();
      final Workshop workshop =
          Workshop.fromMap(wsDoc.data()! as Map<String, dynamic>);
      print(workshop.attendees);
      bool result = workshop.attendees.contains(id);
      print(result.toString() + "    @@@@@@");
      return result;
    } catch (e) {
      print("\n\n\n\n\n\n\n");
      print(e.toString());
      return false;
    }
  }

  Stream<List<String>> getWorkshopAttendees(String workshopName) {
    return _workshops.doc(workshopName).snapshots().map((event) =>
        Workshop.fromMap(event.data() as Map<String, dynamic>).attendees);
  }
  
}
