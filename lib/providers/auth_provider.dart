import 'package:demo_app/api/api.dart';
import 'package:demo_app/models/models.dart';
import 'package:demo_app/shared/utils/utils.dart';
import 'package:demo_app/shared/validator/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthUser extends _$AuthUser {
  bool isValid = false;
  @override
  AuthModel build() {
    return AuthModel();
  }

  void setEmail(String email) {
    state = state.copyWith(email: Email.dirty(email));
    isValid = Formz.validate([state.email ?? const Email.dirty('')]);
  }

  void setPassword(String password) {
    state = state.copyWith(password: Password.dirty(password));
    isValid = Formz.validate([state.email ?? const Email.dirty('')]);
  }

  void reset() {
    state = AuthModel();
  }
}

@riverpod
class UpdatePassword extends _$UpdatePassword {
  bool isValid = false;
  Password password = const Password.pure();
  @override
  Password build() {
    return password;
  }

  void setPassword(String password) {
    state = Password.dirty(password);
    isValid = Formz.validate([state]);
  }

  Future<void> updatePassword(BuildContext context) async {
    if (!isValid) {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar('Contraseña inválida', context,
          isSuccess: false);
      return;
    }
    final api = LoginAuth();
    final result = await api.updatePassword(state.value);
    if (result['success']) {
      CustomSnackbar.showSnackBar(
        result['message'],
        // ignore: use_build_context_synchronously
        context,
      );
    } else {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar(result['message'], context, isSuccess: false);
    }
  }
}

@riverpod
class CreateSeller extends _$CreateSeller {
  bool isValid = false;
  @override
  ClientModel build() {
    return ClientModel();
  }

  void setName(String name) {
    state = state.copyWith(name: GeneralField.dirty(name));
    isValid = Formz.validate([state.name, state.email, state.lastName]);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: GeneralField.dirty(lastName));
    isValid = Formz.validate([state.name, state.email, state.lastName]);
  }

  void setEmail(String email) {
    state = state.copyWith(email: Email.dirty(email));
    isValid = Formz.validate([state.name, state.email, state.lastName]);
  }

  Future<bool> registerUser(
    BuildContext context,
  ) async {
    if (!isValid) {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar('Formulario no valido', context,
          isSuccess: false);
      return false;
    }

    final authInstance = LoginAuth();
    final response =
        await authInstance.registerUser(state.email.value, 'Abc1234.');
    if (!response['success']) {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar(response['message'], context,
          isSuccess: false);
      return false;
    }
    final user = response['user'] as UserCredential;
    final uid = user.user!.uid;
    await authInstance.addUsers(state, uid);
    await authInstance.loginAgain();
    // ignore: use_build_context_synchronously
    CustomSnackbar.showSnackBar('Usuario registrado', context, isSuccess: true);
    return true;
  }

  void reset() {
    state = ClientModel();
  }
}

@riverpod
class RegisterClient extends _$RegisterClient {
  bool isValid = false;
  @override
  ClientModel build() {
    return ClientModel();
  }

  void setName(String name) {
    state = state.copyWith(name: GeneralField.dirty(name));
    isValid = Formz.validate(
        [state.name, state.email, state.lastName, state.password]);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: GeneralField.dirty(lastName));
    isValid = Formz.validate(
        [state.name, state.email, state.lastName, state.password]);
  }

  void setEmail(String email) {
    state = state.copyWith(email: Email.dirty(email));
    isValid = Formz.validate(
        [state.name, state.email, state.lastName, state.password]);
  }

  void setPassword(String password) {
    state = state.copyWith(password: Password.dirty(password));
    isValid = Formz.validate(
        [state.name, state.email, state.lastName, state.password]);
  }

  Future<bool> registerUser(
    BuildContext context,
  ) async {
    if (!isValid) {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar('Formulario no valido', context,
          isSuccess: false);
      return false;
    }

    final authInstance = LoginAuth();
    final response = await authInstance.registerUser(
        state.email.value, state.password.value);
    if (!response['success']) {
      // ignore: use_build_context_synchronously
      CustomSnackbar.showSnackBar(response['message'], context,
          isSuccess: false);
      return false;
    }
    final user = response['user'] as UserCredential;
    final uid = user.user!.uid;
    await authInstance.addUsers(state, uid, isClient: true);
    final responseUser =
        await authInstance.signIn(state.email.value, state.password.value);
    if (responseUser['success']) {
      final user = responseUser['user'];
      final userLoged = await authInstance.getDataUser(user!.user!.uid);
      final userModel = UserModel.instance();
      if (userLoged != null) {
        userModel.setData(userLoged);
      }
    }
    GeneralUtils.setUid(user.user?.uid ?? '');
    GeneralUtils.setPassword(state.password.value);
    // ignore: use_build_context_synchronously
    CustomSnackbar.showSnackBar('Cuenta creada', context, isSuccess: true);
    return true;
  }

  void reset() {
    state = ClientModel();
  }
}

@riverpod
class IsLoginUser extends _$IsLoginUser {
  @override
  bool build() {
    return true;
  }

  void changeState() {
    state = !state;
  }
}
