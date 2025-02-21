import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/navigation/app_navigation.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/assets/app_images.dart';
import 'package:movies_app_clean_arch_bloc/presentation/auth/pages/signin_page.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/pages/home_page.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigator.pushReplacement(context, const SigninPage());
          } else if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1a1b20).withValues(alpha: 0),
                    Color(0xff1a1b20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
