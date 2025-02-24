import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/message/display_message.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/navigation/app_navigation.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/theme/app_colors.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/auth/pages/signup_page.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/pages/home_page.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
            _signInButton(context),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
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

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {
        String email = _emailController.text.trim();
        String password = _passwordController.text.trim();

        SigninReqParams params = SigninReqParams(
          email: email,
          password: password,
        );

        await sl<SigninUsecase>().call(params: params);
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
          const TextSpan(text: 'Don\'t have an account? '),
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignupPage());
                  },
          ),
        ],
      ),
    );
  }
}
