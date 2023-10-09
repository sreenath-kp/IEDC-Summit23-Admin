import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';

final workshopRepositoryProvider = Provider<WorkshopRepository>(
  (ref) {
    return WorkshopRepository(
      firestore: ref.watch(firestoreProvider),
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

  Stream<List<String>> getWorkshopAttendees(String workshopName) {
    return _workshops.doc(workshopName).snapshots().map((event) =>
        Workshop.fromMap(event.data() as Map<String, dynamic>).attendees);
  }
  
}
