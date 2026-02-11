import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelpers {
  static String get uid => FirebaseAuth.instance.currentUser!.uid;

  static DocumentReference<Map<String, dynamic>> userDoc(String uid) =>
      FirebaseFirestore.instance.collection('users').doc(uid);

  static CollectionReference<Map<String, dynamic>> glucoseLogs(String uid) =>
      userDoc(uid).collection('glucose_logs');

  static CollectionReference<Map<String, dynamic>> insulinLogs(String uid) =>
      userDoc(uid).collection('insulin_logs');

  static CollectionReference<Map<String, dynamic>> mealLogs(String uid) =>
      userDoc(uid).collection('meal_logs');

  static CollectionReference<Map<String, dynamic>> glucoseSpots(String uid) =>
      userDoc(uid).collection('glucose_spots');

  static CollectionReference<Map<String, dynamic>> insulinSpots(String uid) =>
      userDoc(uid).collection('insulin_spots');

  static String dayKey(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
