import 'package:flutter/material.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const PasswordValidationPanelWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
  final validationRulesPasswordText = ValueNotifier('');

  @override
  void initState() {
    final PasswordValidationPanelWidget(
      :passwordController,
      :confirmPasswordController,
    ) = widget;

    passwordController.addListener(() {
      validationRulesPasswordText.value = passwordController.text;
    });

    super.initState();
  }

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
        PasswordDotValidationWidget(
          label: 'Mínimo de 8 caracteres',
          key: ValueKey(1),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^.{8,}$',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: '1 letra maiúscula',
          key: ValueKey(2),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^(?=.*[A-Z]).+$',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais números',
          key: ValueKey(3),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^(?=.*\d).+$',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais caracteres especiais',
          key: ValueKey(4),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^(?=.*[!@#\$%^&*()_\-+=\[\]{};:"\\|,.<>?/]).+$',
          updateMatch: (key, match) {},
        ),
        ValueListenableBuilder(
          valueListenable: widget.confirmPasswordController,
          builder: (_, confirmPasswordText, child) {
            return PasswordDotValidationWidget(
              label: 'Senha igual a confirma senha',
              key: ValueKey(5),
              passwordValue: validationRulesPasswordText,
              patternValidation:
                  '^${RegExp.escape(confirmPasswordText.text)}\$',
              updateMatch: (key, match) {},
            );
          },
        ),
      ],
    );
  }
}
