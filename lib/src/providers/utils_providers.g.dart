// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myUserHash() => r'b6c94f13d7abed31ad4c164766908d96b46eabf5';

/// See also [MyUser].
@ProviderFor(MyUser)
final myUserProvider = NotifierProvider<MyUser, MyUserModel?>.internal(
  MyUser.new,
  name: r'myUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyUser = Notifier<MyUserModel?>;
String _$navigationIndexHash() => r'0dcf17ffae80a5006c78698de9bf96144ea1ef3e';

/// See also [NavigationIndex].
@ProviderFor(NavigationIndex)
final navigationIndexProvider =
    AutoDisposeNotifierProvider<NavigationIndex, int>.internal(
  NavigationIndex.new,
  name: r'navigationIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$navigationIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NavigationIndex = AutoDisposeNotifier<int>;
String _$timeRemainingHash() => r'7afdf88b739a8b612d6005e81950d1b6db5465ba';

/// See also [TimeRemaining].
@ProviderFor(TimeRemaining)
final timeRemainingProvider =
    AutoDisposeNotifierProvider<TimeRemaining, double>.internal(
  TimeRemaining.new,
  name: r'timeRemainingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timeRemainingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimeRemaining = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
