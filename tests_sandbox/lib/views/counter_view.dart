import 'package:flutter/material.dart';
import '../view_models/counter_view_model.dart';

class CounterView extends StatefulWidget {
  final CounterViewModel viewModel;

  const CounterView({super.key, required this.viewModel});

  @override
  State<CounterView> createState() => _CounterViewState();
}
class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter MVVM')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${widget.viewModel.count}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.viewModel.increment();
                    });
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.viewModel.decrement();
                    });
                  },
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
