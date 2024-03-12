import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/user_model.dart';
import '../../../providers/utils_providers.dart';
import '../repository/search_repository.dart';

part 'search_controller.g.dart';

@riverpod
Future<void> searchFuture(SearchFutureRef ref, {bool isRefreshed = false}) {
  return ref.watch(searchControllerProvider.notifier).loadAllUsers();
}

@riverpod
class SearchController extends _$SearchController {
  final SearchRepository _searchRepository = SearchRepository();
  @override
  List<MyUserModel> build() {
    return [];
  }

  Future<void> loadAllUsers() async {
    var data = await _searchRepository.getAlUsers();
    data.fold((l) => null, (r) {
      state = r;
    });
  }

  Future<void> searchClicked(String uid) async {
    List<String> searched = [...ref.read(myUserProvider)!.searched];
    ref.read(myUserProvider)!.searched.removeRange(0, searched.length);
    searched = [uid, ...searched];
    ref.read(myUserProvider)!.searched.addAll(searched);

    await _searchRepository.updateHistory(
        searched, ref.read(myUserProvider)!.uid);
  }

  Future<void> searchClear(String uid) async {
    List<String> searched = [...ref.read(myUserProvider)!.searched];

    ref.read(myUserProvider)!.searched.removeRange(0, searched.length);
    searched = searched.filter((t) => t != uid).toList();
    print(ref.read(myUserProvider)!.searched);
    ref.read(myUserProvider)!.searched.addAll(searched);

    await _searchRepository.updateHistory(
        searched, ref.read(myUserProvider)!.uid);
  }

  // List<MyUserModel> searchUser(String searchQueiry) {
  //   List<MyUserModel> results;
  //   results = state.filter(
  //     (user) {
  //       String fullName = user.firstName + user.lastName;
  //       if (fullName.toLowerCase().contains(searchQueiry.toLowerCase())) {
  //         return true;
  //       }
  //       for (int i = 0; i < user.clubs.length; i++) {
  //         if (user.clubs[i]
  //             .toLowerCase()
  //             .contains(searchQueiry.toLowerCase())) {
  //           return true;
  //         }
  //       }
  //       if (user.organization
  //           .toLowerCase()
  //           .contains(searchQueiry.toLowerCase())) {
  //         return true;
  //       }
  //       return false;
  //     },
  //   ).toList();
  //   return results;
  // }
}
