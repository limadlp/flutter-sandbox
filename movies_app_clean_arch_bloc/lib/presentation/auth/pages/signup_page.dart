import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/message/display_message.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/navigation/app_navigation.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/theme/app_colors.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signup_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/auth/pages/signin_page.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/pages/home_page.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(height: 10),
            _emailField(),
            _passwordField(),
            const SizedBox(height: 30),
            _signUpButton(context),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
      obscuringCharacter: '*',
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        return await sl<SignupUsecase>().call(
          params: SignupReqParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, HomePage());
      },
      onFailure: (String error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign In',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SigninPage());
                  },
          ),
        ],
      ),
    );
  }
}
