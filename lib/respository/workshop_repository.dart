import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summit_admin_app/models/workshop_model.dart';

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
}
