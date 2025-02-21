import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/theme/app_theme.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const SplashPage(),
    );
  }
}
