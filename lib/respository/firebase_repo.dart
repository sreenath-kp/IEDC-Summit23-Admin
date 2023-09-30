import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summit_admin_app/models/attendee_model.dart';

class FirebaseRepo {
  final FirebaseFirestore _firestore;
  FirebaseRepo({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  Future<Attendee?> getDatabyId(String id) async {
    try {
      var data = await _firestore.collection('attendees').doc(id).get();
      return Attendee.fromMap(data.data()!);
    } catch (e) {
      return null;
    }
  }
}
