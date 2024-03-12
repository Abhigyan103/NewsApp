import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../../../models/user_model.dart';
import '../../../providers/type_defs.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthenticationRepository()
      : _auth = FirebaseAuth.instance,
        _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection("Users");

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Stream<MyUserModel> getUserData(String uid) {
    return _users
        .doc(uid)
        .snapshots()
        .map((event) => MyUserModel.fromSnapshot(event));
  }

  FutureEither<MyUserModel> createUserWithEmailAndPassword(
      MyUserModel student) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: student.email, password: student.pass!);
      student.uid = userCredential.user!.uid;
      await _users.doc(student.uid).set(student.toJSON());
      return right(student);
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordFailure.code(e.code);
      return left(ex.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  FutureEither<MyUserModel> loginUserWithEmailAndPassword(
      email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      MyUserModel userModel = await getUserData(userCredential.user!.uid).first;
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordFailure.code(e.code);
      return left(ex.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  FutureVoid forgotPassord(String email) async {
    try {
      return right(await _auth.sendPasswordResetEmail(email: email.trim()));
    } catch (e) {
      return left(e.toString());
    }
  }

  FutureVoid verifyEmail(String email) async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> reAuth(String email, String password) async {
    await _auth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password));
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<void> delete() async =>
      await FirebaseAuth.instance.currentUser!.delete();
}
