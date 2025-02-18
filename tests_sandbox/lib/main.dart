import 'package:flutter/material.dart';
import 'models/counter_model.dart';
import 'view_models/counter_view_model.dart';
import 'views/counter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterView(viewModel: CounterViewModel(CounterModel())),
    );
  }
}
