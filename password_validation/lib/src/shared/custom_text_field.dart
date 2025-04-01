import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Key? textFieldKey;

  const CustomTextField({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.obscureText,
    this.hintText,
    this.suffix,
    this.controller,
    this.validator,
    this.focusNode,
    this.textFieldKey,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final CustomTextField(
      :hintText,
      :label,
      :backgroundColor,
      :suffix,
      :textFieldKey,
      :obscureText,
      :controller,
      :validator,
      :focusNode,
    ) = widget;
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        TextFormField(
          key: textFieldKey,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            isDense: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffix: suffix,
          ),
        ),
      ],
    );
  }
}
