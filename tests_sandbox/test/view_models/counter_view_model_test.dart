import 'package:flutter_test/flutter_test.dart';
import 'package:tests_sandbox/models/counter_model.dart';
import 'package:tests_sandbox/view_models/counter_view_model.dart';

void main() {
  group('CounterViewModel Tests', () {
    test('Initial count should be 0', () {
      final viewModel = CounterViewModel(CounterModel());
      expect(viewModel.count, 0);
    });

    test('Increment should increase count', () {
      final viewModel = CounterViewModel(CounterModel());
      viewModel.increment();
      expect(viewModel.count, 1);
    });

    test('Decrement should decrease count', () {
      final viewModel = CounterViewModel(CounterModel(count: 1));
      viewModel.decrement();
      expect(viewModel.count, 0);
    });
  });
}
