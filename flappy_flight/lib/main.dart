import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: MaterialApp(
        title: 'Flappy Flight',
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
