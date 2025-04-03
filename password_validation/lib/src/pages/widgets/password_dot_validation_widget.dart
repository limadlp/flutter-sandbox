import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class PasswordDotValidationWidget extends StatelessWidget {
  final String label;
  const PasswordDotValidationWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 13,
          height: 13,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: coolGreyColor,
          ),
        ),
      ],
    );
  }
}
