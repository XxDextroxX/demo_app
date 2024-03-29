// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getShoppingHash() => r'976fcdf732bb1b61aa96c0b3f682b0895a7f99ff';

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

/// See also [getShopping].
@ProviderFor(getShopping)
const getShoppingProvider = GetShoppingFamily();

/// See also [getShopping].
class GetShoppingFamily extends Family<AsyncValue<List<ShoppingModel>>> {
  /// See also [getShopping].
  const GetShoppingFamily();

  /// See also [getShopping].
  GetShoppingProvider call({
    bool updateStateAux = true,
  }) {
    return GetShoppingProvider(
      updateStateAux: updateStateAux,
    );
  }

  @override
  GetShoppingProvider getProviderOverride(
    covariant GetShoppingProvider provider,
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
  String? get name => r'getShoppingProvider';
}

/// See also [getShopping].
class GetShoppingProvider
    extends AutoDisposeFutureProvider<List<ShoppingModel>> {
  /// See also [getShopping].
  GetShoppingProvider({
    bool updateStateAux = true,
  }) : this._internal(
          (ref) => getShopping(
            ref as GetShoppingRef,
            updateStateAux: updateStateAux,
          ),
          from: getShoppingProvider,
          name: r'getShoppingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getShoppingHash,
          dependencies: GetShoppingFamily._dependencies,
          allTransitiveDependencies:
              GetShoppingFamily._allTransitiveDependencies,
          updateStateAux: updateStateAux,
        );

  GetShoppingProvider._internal(
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
    FutureOr<List<ShoppingModel>> Function(GetShoppingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetShoppingProvider._internal(
        (ref) => create(ref as GetShoppingRef),
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
  AutoDisposeFutureProviderElement<List<ShoppingModel>> createElement() {
    return _GetShoppingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetShoppingProvider &&
        other.updateStateAux == updateStateAux;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updateStateAux.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetShoppingRef on AutoDisposeFutureProviderRef<List<ShoppingModel>> {
  /// The parameter `updateStateAux` of this provider.
  bool get updateStateAux;
}

class _GetShoppingProviderElement
    extends AutoDisposeFutureProviderElement<List<ShoppingModel>>
    with GetShoppingRef {
  _GetShoppingProviderElement(super.provider);

  @override
  bool get updateStateAux => (origin as GetShoppingProvider).updateStateAux;
}

String _$listShoppingHash() => r'c928c311bd5b34433d701005466e940294a707fd';

/// See also [ListShopping].
@ProviderFor(ListShopping)
final listShoppingProvider =
    AutoDisposeNotifierProvider<ListShopping, List<ProductModel>>.internal(
  ListShopping.new,
  name: r'listShoppingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listShoppingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListShopping = AutoDisposeNotifier<List<ProductModel>>;
String _$addShoppingHash() => r'874bf4fe3c93cc2f7ae72d1e142f7ec0dde44bde';

/// See also [AddShopping].
@ProviderFor(AddShopping)
final addShoppingProvider =
    AutoDisposeNotifierProvider<AddShopping, int>.internal(
  AddShopping.new,
  name: r'addShoppingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addShoppingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddShopping = AutoDisposeNotifier<int>;
String _$totalToPayHash() => r'6679cc1f9bb60b7d4154f253d06b8d06a7318258';

/// See also [TotalToPay].
@ProviderFor(TotalToPay)
final totalToPayProvider =
    AutoDisposeNotifierProvider<TotalToPay, double>.internal(
  TotalToPay.new,
  name: r'totalToPayProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalToPayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalToPay = AutoDisposeNotifier<double>;
String _$updateStateShoppingHash() =>
    r'c69b82833306ea6617ef257a2e9606fef230bae0';

/// See also [UpdateStateShopping].
@ProviderFor(UpdateStateShopping)
final updateStateShoppingProvider =
    AutoDisposeNotifierProvider<UpdateStateShopping, bool>.internal(
  UpdateStateShopping.new,
  name: r'updateStateShoppingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateStateShoppingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateStateShopping = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
