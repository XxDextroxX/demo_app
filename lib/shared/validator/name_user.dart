import 'package:formz/formz.dart';

// Define input validation errors
enum NameUserError { empty, length, format, samePassword }

// Extend FormzInput and provide the input type and error type.
class NameUser extends FormzInput<String, NameUserError> {
  // Call super.pure to represent an unmodified form input.
  const NameUser.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameUser.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameUserError.empty) return 'El campo es requerido';
    if (displayError == NameUserError.length) return 'Ingrese un valor válido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameUserError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameUserError.empty;
    if (value.length < 2) return NameUserError.length;

    return null;
  }
}
