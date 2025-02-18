class CounterModel {
  int count;

  CounterModel({this.count = 0});

  void increment() => count++;
  void decrement() => count--;
}
