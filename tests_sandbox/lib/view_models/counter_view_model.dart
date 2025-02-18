import '../models/counter_model.dart';

class CounterViewModel {
  final CounterModel _counterModel;

  CounterViewModel(this._counterModel);

  int get count => _counterModel.count;

  void increment() => _counterModel.increment();
  void decrement() => _counterModel.decrement();
}
