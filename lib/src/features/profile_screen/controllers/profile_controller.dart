import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/profile_repository.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  return ProfileController(
    userProfileRepository: userProfileRepository,
    ref: ref,
  );
});

class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _userProfileRepository;
  final Ref _ref;
  ProfileController(
      {required ProfileRepository userProfileRepository, required Ref ref})
      : _userProfileRepository = userProfileRepository,
        _ref = ref,
        super(false);
  // FutureVoid changeUserData(
  //     {String? firstName, String? lastName, DateTime? dob}) async {
  //   MyUserModel? newStudent = _ref
  //       .read(myUserProvider)!
  //       .copyWith(firstName: firstName, lastName: lastName, dob: dob);
  //   state = true;
  //   try {
  //     await _userProfileRepository.editProfile(newStudent);
  //     _ref.read(myUserProvider.notifier).update(newStudent);
  //   } catch (e) {
  //     state = false;
  //     return left('Could not update profile');
  //   }
  //   state = false;
  //   return right(null);
  // }
}
