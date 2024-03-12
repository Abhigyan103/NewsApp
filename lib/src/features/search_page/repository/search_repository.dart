import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import '../../../models/user_model.dart';
import '../../../providers/type_defs.dart';

class SearchRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  SearchRepository()
      : _auth = FirebaseAuth.instance,
        _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection("Users");

  Stream<MyUserModel> getUserData(String uid) {
    return _users
        .doc(uid)
        .snapshots()
        .map((event) => MyUserModel.fromSnapshot(event));
  }

  FutureVoid updateHistory(List<String> searched, String uid) async {
    try {
      _users.doc(uid).update({"Searched": searched});
      return right(null);
    } catch (e) {
      return left('Couldn\'t.');
    }
  }

  FutureEither<List<MyUserModel>> getAlUsers() async {
    try {
      List<MyUserModel> users = (await _users.get())
          .docs
          .map((e) => MyUserModel.fromSnapshot(e))
          .toList();
      return right(users);
    } catch (e) {
      return left("Cannot fetch users");
    }
  }
}
