import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final firestore = FirebaseFirestore.instance;

  Future<void> addBatch(
      {String? id,
      required String batchname,
      required String location,
      required String numberofstudent,
      required String leadername,
      required String leadermobile}) async {
    try {
      await firestore.collection('batch').doc().set({
        'Batchname': batchname,
        'loctation': location,
        'Studentnumber': numberofstudent,
        'Leadername': leadername,
        'Leadermobile': leadermobile
      });
    } catch (e) {
      rethrow;
    }
  }

  Future getBacth() async {}
}
