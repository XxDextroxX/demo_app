import 'package:formz/formz.dart';

// Define input validation errors
enum TelephoneError { empty, length, format }

// Extend FormzInput and provide the input type and error type.
class TelePhone extends FormzInput<String, TelephoneError> {
  //expresion regular para validar el telefono
  static final RegExp telephoneRegExp = RegExp(
    r'^[0-9]+$',
  );

  // Call super.pure to represent an unmodified form input.
  const TelePhone.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TelePhone.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TelephoneError.empty) return 'El campo es requerido';
    if (displayError == TelephoneError.length) {
      return 'Ingrese un numero válido';
    }
    if (displayError == TelephoneError.format) {
      return 'Ingrese un numero válido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  TelephoneError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TelephoneError.empty;
    if (value.length != 10) return TelephoneError.length;
    if (!telephoneRegExp.hasMatch(value)) return TelephoneError.format;
    return null;
  }
}
