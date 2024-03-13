import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/utils.dart';
import '../../../models/user_model.dart';
import '../../../providers/type_defs.dart';
import '../../../providers/utils_providers.dart';
import '../repository/authentication_repository.dart';

part 'authentication_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  @override
  bool build() {
    return false;
  }

  Future<void> registerUser(
      BuildContext context, MyUserModel myUser, VoidCallback cb) async {
    state = true;
    var user = await _authRepository.createUserWithEmailAndPassword(myUser);
    state = false;
    user.fold(
        (l) => showSnackBar(
            context: context,
            title: l,
            snackBarType: SnackBarType.error), (userModel) {
      ref.read(myUserProvider.notifier).update(userModel);
      cb();
    });
  }

  Future<void> loginUser(
      BuildContext context, String email, String pass, VoidCallback cb) async {
    state = true;
    var user =
        await _authRepository.loginUserWithEmailAndPassword(email.trim(), pass);
    state = false;
    user.fold(
        (l) => showSnackBar(
            context: context,
            title: l,
            snackBarType: SnackBarType.error), (userModel) {
      ref.read(myUserProvider.notifier).update(userModel);
    });
  }

  FutureVoid changePassword(String oldPassword, String newPassword) async {
    User user = FirebaseAuth.instance.currentUser!;
    var reAuthenticated = await reAuth(oldPassword);
    return reAuthenticated.fold((l) => left(l), (r) async {
      try {
        state = true;
        return right(await user.updatePassword(newPassword));
      } catch (e) {
        return left(e.toString());
      } finally {
        state = false;
      }
    });
  }

  Future<void> verifyEmail(BuildContext context) async {
    state = true;
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      var verify = await _authRepository.verifyEmail(email);
      verify.fold(
          (l) => showSnackBar(
              context: context, title: l, snackBarType: SnackBarType.error),
          (r) => showSnackBar(
              context: context,
              title: 'Mail sent.',
              snackBarType: SnackBarType.good));
    }
    state = false;
  }

  Future<void> forgotPassord(BuildContext context, String email) async {
    state = true;
    var verify = await _authRepository.verifyEmail(email);
    verify.fold(
        (l) => showSnackBar(
            context: context, title: l, snackBarType: SnackBarType.error),
        (r) => showSnackBar(
            context: context,
            title: 'Mail sent.',
            snackBarType: SnackBarType.good));
    state = false;
  }

  FutureVoid reAuth(String password) async {
    try {
      await _authRepository.reAuth(ref.read(myUserProvider)!.email, password);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? 'Error');
    } catch (e) {
      return left(e.toString());
    }
    return right(null);
  }

  Timer reloadUserPeriodically(VoidCallback cb) {
    var timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        cb();
      }
    });
    return timer;
  }

  Future<void> logout(VoidCallback cb) async {
    state = true;
    await _authRepository.logOut();
    state = false;
    cb();
    ref.read(myUserProvider.notifier).update(null);
    ref.read(navigationIndexProvider.notifier).update(0);
  }

  FutureVoid deactivate(VoidCallback cb) async {
    try {
      state = true;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
      await _authRepository.delete();
      state = false;
      logout(cb);
    } on FirebaseAuthException catch (e) {
      state = false;
      return left(e.message ?? '');
    }
    return right(null);
  }

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<MyUserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }
}
