// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getShoppingHash() => r'baf51fec0cb43aeae025250ddc1bfad2939ce7be';

/// See also [getShopping].
@ProviderFor(getShopping)
final getShoppingProvider =
    AutoDisposeStreamProvider<List<ShoppingModel>>.internal(
  getShopping,
  name: r'getShoppingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getShoppingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetShoppingRef = AutoDisposeStreamProviderRef<List<ShoppingModel>>;
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
