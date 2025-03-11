import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/core/configs/theme/app_theme.dart';
import 'package:movies_app_clean_arch_bloc/presentation/auth/bloc/auth_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/pages/splash_page.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
        BlocProvider(create: (context) => AuthCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
          },
        ),
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
