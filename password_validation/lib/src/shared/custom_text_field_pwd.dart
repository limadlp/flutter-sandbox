import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/custom_text_field.dart';

class CustomTextFieldPwd extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final TextEditingController controller;

  const CustomTextFieldPwd({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  State<CustomTextFieldPwd> createState() => _CustomTextFieldPwdState();
}

class _CustomTextFieldPwdState extends State<CustomTextFieldPwd> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    final CustomTextFieldPwd(:label, :backgroundColor, :controller) = widget;

    return CustomTextField(
      label: label,
      backgroundColor: backgroundColor,
      obscureText: obscureText,
      suffix: IconButton(
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
