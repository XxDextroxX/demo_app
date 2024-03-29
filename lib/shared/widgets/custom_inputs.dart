import 'package:flutter/material.dart';

class CustomInputs extends StatelessWidget {
  const CustomInputs({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.borderRadious = 10,
    this.colorStyle,
    this.enabled = true,
    this.textCapitalization = true,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? errorText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final double borderRadious;
  final bool enabled;
  final Color? colorStyle;
  final bool textCapitalization;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(
        color: colorStyle ?? Theme.of(context).primaryColorDark,
      ),
      textCapitalization: textCapitalization
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      enabled: enabled,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIconColor: colorStyle ?? Theme.of(context).primaryColorDark,
        suffixIconColor: colorStyle ?? Theme.of(context).primaryColorDark,
        hintStyle: TextStyle(
            color: colorStyle ?? Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.normal),
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        filled: false,
        fillColor: Theme.of(context).primaryColorDark.withOpacity(0.6),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadious),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
