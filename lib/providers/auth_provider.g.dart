// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserHash() => r'83f128f23ebd06f6d4cc151db732c777ba77be53';

/// See also [AuthUser].
@ProviderFor(AuthUser)
final authUserProvider =
    AutoDisposeNotifierProvider<AuthUser, AuthModel>.internal(
  AuthUser.new,
  name: r'authUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthUser = AutoDisposeNotifier<AuthModel>;
String _$updatePasswordHash() => r'f207829a784084f0f8442627bca106740cb057bf';

/// See also [UpdatePassword].
@ProviderFor(UpdatePassword)
final updatePasswordProvider =
    AutoDisposeNotifierProvider<UpdatePassword, Password>.internal(
  UpdatePassword.new,
  name: r'updatePasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updatePasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdatePassword = AutoDisposeNotifier<Password>;
String _$createSellerHash() => r'ca5b2c689d760680fddab59e4c924fa479144b37';

/// See also [CreateSeller].
@ProviderFor(CreateSeller)
final createSellerProvider =
    AutoDisposeNotifierProvider<CreateSeller, ClientModel>.internal(
  CreateSeller.new,
  name: r'createSellerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$createSellerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateSeller = AutoDisposeNotifier<ClientModel>;
String _$registerClientHash() => r'0d1d7a8e2ff7a6c1388fcf6c6e58738a816350b4';

/// See also [RegisterClient].
@ProviderFor(RegisterClient)
final registerClientProvider =
    AutoDisposeNotifierProvider<RegisterClient, ClientModel>.internal(
  RegisterClient.new,
  name: r'registerClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RegisterClient = AutoDisposeNotifier<ClientModel>;
String _$isLoginUserHash() => r'8149c8745489f8df797b251ea29f438c2e5bba93';

/// See also [IsLoginUser].
@ProviderFor(IsLoginUser)
final isLoginUserProvider =
    AutoDisposeNotifierProvider<IsLoginUser, bool>.internal(
  IsLoginUser.new,
  name: r'isLoginUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoginUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsLoginUser = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
