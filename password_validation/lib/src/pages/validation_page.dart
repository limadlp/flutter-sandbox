import 'package:flutter/material.dart';
import 'package:password_validation/src/pages/widgets/password_validation_panel_widget.dart';
import 'package:password_validation/src/shared/colors_app.dart';
import 'package:password_validation/src/shared/custom_text_field_pwd.dart';

class ValidationPage extends StatelessWidget {
  const ValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGreyColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 44, bottom: 42),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  'Defina uma senha',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'Uma senha forte ajuda a manter sua conta segura',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: mediumGreyColor,
                  ),
                ),
                SizedBox(height: 26),
                CustomTextFieldPwd(
                  label: 'Senha',
                  backgroundColor: Colors.white,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 26),
                CustomTextFieldPwd(
                  label: 'Confirmar senha',
                  backgroundColor: Colors.white,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 37),
                PasswordValidationPanelWidget(),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Senha Reprovada'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
