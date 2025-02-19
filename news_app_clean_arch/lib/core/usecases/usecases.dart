abstract class Usecases<Type, Params> {
  Future<Type> call(Params params);
}
