import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length, samePassword, letters, numbers, special }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  static final RegExp passwordRegExpLetters = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z]).+$',
  );

  static final RegExp passwordRegExpNumber = RegExp(
    r'^(?=.*\d).+$',
  );

  // static final RegExp passwordRegExp3Chars = RegExp(
  //   r'^(?=.*[.\-]).+$',
  // );

  //expresion regular para verificar caracteres especiales incluido * + ? ^ $
  static final RegExp passwordRegExpSpecial = RegExp(
    r'^(?=.*[^\w\s]).+$',
  );

  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.length) return 'Mínimo 8 caracteres';
    if (displayError == PasswordError.letters) {
      return 'Debe contener una mayúscula, una minúscula.';
    }
    if (displayError == PasswordError.samePassword) {
      return 'Las contraseñas no coinciden';
    }
    if (displayError == PasswordError.numbers) {
      return 'Debe contener un número.';
    }
    if (displayError == PasswordError.special) {
      return 'Debe contener un carácter especial.';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 8) return PasswordError.length;
    if (!passwordRegExpLetters.hasMatch(value)) return PasswordError.letters;
    if (value != value) return PasswordError.samePassword;
    if (!passwordRegExpNumber.hasMatch(value)) return PasswordError.numbers;
    if (!passwordRegExpSpecial.hasMatch(value)) return PasswordError.special;

    return null;
  }
}
