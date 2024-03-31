// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_product.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsRealTimeHash() =>
    r'05d40eba42dee77f742edcff31f1c1e640b81666';

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

/// See also [getProductsRealTime].
@ProviderFor(getProductsRealTime)
const getProductsRealTimeProvider = GetProductsRealTimeFamily();

/// See also [getProductsRealTime].
class GetProductsRealTimeFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [getProductsRealTime].
  const GetProductsRealTimeFamily();

  /// See also [getProductsRealTime].
  GetProductsRealTimeProvider call({
    bool getAll = true,
  }) {
    return GetProductsRealTimeProvider(
      getAll: getAll,
    );
  }

  @override
  GetProductsRealTimeProvider getProviderOverride(
    covariant GetProductsRealTimeProvider provider,
  ) {
    return call(
      getAll: provider.getAll,
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
  String? get name => r'getProductsRealTimeProvider';
}

/// See also [getProductsRealTime].
class GetProductsRealTimeProvider
    extends AutoDisposeStreamProvider<List<ProductModel>> {
  /// See also [getProductsRealTime].
  GetProductsRealTimeProvider({
    bool getAll = true,
  }) : this._internal(
          (ref) => getProductsRealTime(
            ref as GetProductsRealTimeRef,
            getAll: getAll,
          ),
          from: getProductsRealTimeProvider,
          name: r'getProductsRealTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsRealTimeHash,
          dependencies: GetProductsRealTimeFamily._dependencies,
          allTransitiveDependencies:
              GetProductsRealTimeFamily._allTransitiveDependencies,
          getAll: getAll,
        );

  GetProductsRealTimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getAll,
  }) : super.internal();

  final bool getAll;

  @override
  Override overrideWith(
    Stream<List<ProductModel>> Function(GetProductsRealTimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsRealTimeProvider._internal(
        (ref) => create(ref as GetProductsRealTimeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getAll: getAll,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ProductModel>> createElement() {
    return _GetProductsRealTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsRealTimeProvider && other.getAll == getAll;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getAll.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsRealTimeRef
    on AutoDisposeStreamProviderRef<List<ProductModel>> {
  /// The parameter `getAll` of this provider.
  bool get getAll;
}

class _GetProductsRealTimeProviderElement
    extends AutoDisposeStreamProviderElement<List<ProductModel>>
    with GetProductsRealTimeRef {
  _GetProductsRealTimeProviderElement(super.provider);

  @override
  bool get getAll => (origin as GetProductsRealTimeProvider).getAll;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
