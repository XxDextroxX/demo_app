import 'package:formz/formz.dart';

// Define input validation errors
enum PriceError { empty, format }

class PriceInput extends FormzInput<String, PriceError> {
  // Expresión regular para validar el precio (números enteros y decimales)
  static final RegExp priceRegExp = RegExp(
    r'^\d+(\.\d{1,2})?$',
  );

  const PriceInput.pure() : super.pure('');
  const PriceInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PriceError.empty) return 'El campo es requerido';
    if (displayError == PriceError.format) {
      return 'Ingrese un precio válido';
    }

    return null;
  }

  @override
  PriceError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PriceError.empty;
    if (!priceRegExp.hasMatch(value)) return PriceError.format;
    return null;
  }
}
