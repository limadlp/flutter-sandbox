class Singleton {
  static Singleton? _instance;

  ///
  /// Private constructor to prevent instantiation
  Singleton._internal() {
    print('Creating an instance of Singleton');
  }

  ///
  /// lazy instantiation
  static Singleton? get instance {
    if (_instance == null) {
      _instance = Singleton._internal();
    } // same as _instance ??= Singleton._internal();

    return _instance;
  }
}
