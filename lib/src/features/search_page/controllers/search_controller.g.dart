// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchFutureHash() => r'99831a7433bf3e4ccc7b5d348830ae23b5c33d53';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [searchFuture].
@ProviderFor(searchFuture)
const searchFutureProvider = SearchFutureFamily();

/// See also [searchFuture].
class SearchFutureFamily extends Family<AsyncValue<void>> {
  /// See also [searchFuture].
  const SearchFutureFamily();

  /// See also [searchFuture].
  SearchFutureProvider call({
    bool isRefreshed = false,
  }) {
    return SearchFutureProvider(
      isRefreshed: isRefreshed,
    );
  }

  @override
  SearchFutureProvider getProviderOverride(
    covariant SearchFutureProvider provider,
  ) {
    return call(
      isRefreshed: provider.isRefreshed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchFutureProvider';
}

/// See also [searchFuture].
class SearchFutureProvider extends AutoDisposeFutureProvider<void> {
  /// See also [searchFuture].
  SearchFutureProvider({
    bool isRefreshed = false,
  }) : this._internal(
          (ref) => searchFuture(
            ref as SearchFutureRef,
            isRefreshed: isRefreshed,
          ),
          from: searchFutureProvider,
          name: r'searchFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchFutureHash,
          dependencies: SearchFutureFamily._dependencies,
          allTransitiveDependencies:
              SearchFutureFamily._allTransitiveDependencies,
          isRefreshed: isRefreshed,
        );

  SearchFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isRefreshed,
  }) : super.internal();

  final bool isRefreshed;

  @override
  Override overrideWith(
    FutureOr<void> Function(SearchFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchFutureProvider._internal(
        (ref) => create(ref as SearchFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isRefreshed: isRefreshed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SearchFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchFutureProvider && other.isRefreshed == isRefreshed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isRefreshed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchFutureRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `isRefreshed` of this provider.
  bool get isRefreshed;
}

class _SearchFutureProviderElement
    extends AutoDisposeFutureProviderElement<void> with SearchFutureRef {
  _SearchFutureProviderElement(super.provider);

  @override
  bool get isRefreshed => (origin as SearchFutureProvider).isRefreshed;
}

String _$searchControllerHash() => r'82cb1610f8f6f5a935d2cb6e4e551ef95ad4e2b9';

/// See also [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider =
    AutoDisposeNotifierProvider<SearchController, List<MyUserModel>>.internal(
  SearchController.new,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchController = AutoDisposeNotifier<List<MyUserModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
