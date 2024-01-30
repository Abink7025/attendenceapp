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

  Future<void> addstudent(
      {required String id,
      required String name,
      required String domain,
      required String mobnumber,
      required String gender,
      required emailid}) async {
    try {
      await firestore.collection('student').doc().set({
        'Batch id': id,
        'Name': name,
        'Domain': domain,
        'mobile number': mobnumber,
        'Gender': gender,
        'Email': emailid,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updates(
      {required String batchname,
      required String location,
      required String leadername,
      required String leadermobile,
      required String docId}) async {
    try {
      await firestore.collection('batch').doc(docId).update({
        'Batchname': batchname,
        'loctation': location,
        'Leadername': leadername,
        'Leadermobile': leadermobile
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection('batch').doc(id).delete();
    } catch (e) {}
  }

  Future<void> addattendance(
      {required String batchId,
      required DateTime date,
      required String attendance,
      required String studentId,
      required String name}) async {
    try {
      await firestore.collection('attendance').doc().set({
        'Batch id': batchId,
        'Date': date,
        'Attendance': attendance,
        'Student id': studentId,
        'Student name': name
      });
    } catch (e) {}
  }

  Future getBacth() async {}
}
