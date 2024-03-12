import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model.dart';

final userProfileRepositoryProvider = Provider((ref) {
  return ProfileRepository(firestore: FirebaseFirestore.instance);
});

class ProfileRepository {
  final FirebaseFirestore _firestore;
  ProfileRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _users => _firestore.collection("Users");

  Future<void> editProfile(MyUserModel user) async {
    await _users.doc(user.uid).update(user.toJSON());
  }
}
