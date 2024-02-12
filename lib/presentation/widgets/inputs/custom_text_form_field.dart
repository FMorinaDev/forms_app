import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Icon? icon;
  final bool? obscureText;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.icon, 
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        errorText: errorMessage,
        prefixIcon: icon
      ),
    );
  }
}