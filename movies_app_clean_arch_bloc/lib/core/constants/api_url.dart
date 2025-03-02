class ApiUrl {
  static const String baseUrl = 'http://localhost:5000/';

  static const apiV = 'api/v1/';

  static const String signup = '$baseUrl${apiV}auth/signup';
  static const String signin = '$baseUrl${apiV}auth/signin';
  static const trendingMovies = '$baseUrl${apiV}movie/trending';
}
