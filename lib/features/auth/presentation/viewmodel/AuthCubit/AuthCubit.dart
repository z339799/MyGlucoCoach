import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfeproject/core/index.dart';

part 'AuthState.dart';

class AuthCubit extends Cubit<Authstate> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUpPatient(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await result.user!.updateDisplayName('patient');

      final uid = result.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'role': 'patient',
        'email': email,
        'displayName': name,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      emit(AuthSuccess(user: FirebaseAuth.instance.currentUser!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(message: e.message ?? 'Auth error'));
    } catch (_) {
      emit(AuthFailed(message: 'An error occured'));
    }
  }

  Future<void> signUpDoctor(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await result.user!.updateDisplayName('doctor');

      final uid = result.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'role': 'doctor',
        'email': email,
        'displayName': '',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      emit(AuthSuccess(user: FirebaseAuth.instance.currentUser!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(message: e.message ?? 'Auth error'));
    } catch (_) {
      emit(AuthFailed(message: 'An error occured'));
    }
  }

    Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = result.user;
      if (user == null) {
        emit(AuthFailed(message: 'Login failed'));
        return;
      }

      final uid = user.uid;
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final snap = await docRef.get();

      // Determine role:
      // 1) Prefer FirebaseAuth.displayName if it's 'patient' or 'doctor'
      // 2) Else prefer Firestore users/{uid}.role
      // 3) Else fallback to 'patient'
      final authFlag = (user.displayName ?? '').toLowerCase();
      String role = (authFlag == 'doctor' || authFlag == 'patient')
          ? authFlag
          : 'patient';

      if (authFlag != 'doctor' && authFlag != 'patient') {
        if (snap.exists) {
          final data = snap.data() as Map<String, dynamic>;
          final fsRole = (data['role'] ?? '').toString().toLowerCase();
          if (fsRole == 'doctor' || fsRole == 'patient') {
            role = fsRole;
          }
        }
        // IMPORTANT: keep your existing app logic working
        // by setting FirebaseAuth.displayName to the role.
        await user.updateDisplayName(role);
      }

      // Ensure profile exists / update timestamps
      if (!snap.exists) {
        await docRef.set({
          'uid': uid,
          'role': role,
          'email': user.email ?? email,
          'displayName': '',
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      } else {
        await docRef.set({
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }

      emit(AuthSuccess(user: user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(message: e.message ?? 'Auth error'));
    } catch (_) {
      emit(AuthFailed(message: 'An error occured'));
    }
  }


  /// Keeps your existing navigation logic (returns route name).
  /// NOTE: No `emit()` here to keep it simple and avoid side-effects.
  String onAppStarted() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if ((user.displayName ?? '').toLowerCase() == 'patient') {
        return 'patientHome';
      }
      return 'doctorHome';
    }
    return 'onOne';
  }
}
