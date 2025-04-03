import 'package:flutter/material.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  const PasswordValidationPanelWidget({super.key});

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: Text(
            'SUA SENHA DEVE CONTER',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),

        PasswordDotValidationWidget(label: 'Mínimo de 8 caracteres'),
        PasswordDotValidationWidget(label: '1 letra maiúscula'),
        PasswordDotValidationWidget(label: '1 ou mais números'),
        PasswordDotValidationWidget(label: '1 ou mais letras'),
        PasswordDotValidationWidget(label: 'Senha igual a confirma senha'),
      ],
    );
  }
}
