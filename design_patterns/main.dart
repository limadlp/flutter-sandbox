import 'singleton.dart';

main() {
  var singleton1 = Singleton.instance;
  var singleton2 = Singleton.instance;

  print(identical(singleton1, singleton2)); // true
}
