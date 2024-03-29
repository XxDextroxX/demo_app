import 'package:formz/formz.dart';

// Define input validation errors
enum GeneralFieldError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class GeneralField extends FormzInput<String, GeneralFieldError> {
  // Call super.pure to represent an unmodified form input.
  const GeneralField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const GeneralField.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == GeneralFieldError.empty) return 'El campo es requerido';
    if (displayError == GeneralFieldError.lenght) {
      return 'El campo debe tener al menos 4 caracteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  GeneralFieldError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return GeneralFieldError.empty;
    if (value.length < 2) return GeneralFieldError.lenght;
    return null;
  }
}
