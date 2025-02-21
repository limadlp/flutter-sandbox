import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/assets/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}
