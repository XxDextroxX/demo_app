// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_product.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'85e11987ea326247b97ccf2ce5e92df1c263e643';

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

/// See also [getProducts].
@ProviderFor(getProducts)
const getProductsProvider = GetProductsFamily();

/// See also [getProducts].
class GetProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [getProducts].
  const GetProductsFamily();

  /// See also [getProducts].
  GetProductsProvider call({
    bool updateStateAux = true,
  }) {
    return GetProductsProvider(
      updateStateAux: updateStateAux,
    );
  }

  @override
  GetProductsProvider getProviderOverride(
    covariant GetProductsProvider provider,
  ) {
    return call(
      updateStateAux: provider.updateStateAux,
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
  String? get name => r'getProductsProvider';
}

/// See also [getProducts].
class GetProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [getProducts].
  GetProductsProvider({
    bool updateStateAux = true,
  }) : this._internal(
          (ref) => getProducts(
            ref as GetProductsRef,
            updateStateAux: updateStateAux,
          ),
          from: getProductsProvider,
          name: r'getProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsHash,
          dependencies: GetProductsFamily._dependencies,
          allTransitiveDependencies:
              GetProductsFamily._allTransitiveDependencies,
          updateStateAux: updateStateAux,
        );

  GetProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.updateStateAux,
  }) : super.internal();

  final bool updateStateAux;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(GetProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsProvider._internal(
        (ref) => create(ref as GetProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        updateStateAux: updateStateAux,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _GetProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsProvider &&
        other.updateStateAux == updateStateAux;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updateStateAux.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `updateStateAux` of this provider.
  bool get updateStateAux;
}

class _GetProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with GetProductsRef {
  _GetProductsProviderElement(super.provider);

  @override
  bool get updateStateAux => (origin as GetProductsProvider).updateStateAux;
}

String _$getAllProductsHash() => r'4223bcd8b1ca416adb62d8b1f9d6cd02cbdd8d20';

/// See also [getAllProducts].
@ProviderFor(getAllProducts)
const getAllProductsProvider = GetAllProductsFamily();

/// See also [getAllProducts].
class GetAllProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [getAllProducts].
  const GetAllProductsFamily();

  /// See also [getAllProducts].
  GetAllProductsProvider call({
    bool updateStateAux = true,
  }) {
    return GetAllProductsProvider(
      updateStateAux: updateStateAux,
    );
  }

  @override
  GetAllProductsProvider getProviderOverride(
    covariant GetAllProductsProvider provider,
  ) {
    return call(
      updateStateAux: provider.updateStateAux,
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
  String? get name => r'getAllProductsProvider';
}

/// See also [getAllProducts].
class GetAllProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [getAllProducts].
  GetAllProductsProvider({
    bool updateStateAux = true,
  }) : this._internal(
          (ref) => getAllProducts(
            ref as GetAllProductsRef,
            updateStateAux: updateStateAux,
          ),
          from: getAllProductsProvider,
          name: r'getAllProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllProductsHash,
          dependencies: GetAllProductsFamily._dependencies,
          allTransitiveDependencies:
              GetAllProductsFamily._allTransitiveDependencies,
          updateStateAux: updateStateAux,
        );

  GetAllProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.updateStateAux,
  }) : super.internal();

  final bool updateStateAux;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(GetAllProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllProductsProvider._internal(
        (ref) => create(ref as GetAllProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        updateStateAux: updateStateAux,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _GetAllProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllProductsProvider &&
        other.updateStateAux == updateStateAux;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updateStateAux.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `updateStateAux` of this provider.
  bool get updateStateAux;
}

class _GetAllProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with GetAllProductsRef {
  _GetAllProductsProviderElement(super.provider);

  @override
  bool get updateStateAux => (origin as GetAllProductsProvider).updateStateAux;
}

String _$updateStateHash() => r'55761182f07e9d5cb5cdfe42500d8cfd907ba0c0';

/// See also [UpdateState].
@ProviderFor(UpdateState)
final updateStateProvider =
    AutoDisposeNotifierProvider<UpdateState, bool>.internal(
  UpdateState.new,
  name: r'updateStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$updateStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
