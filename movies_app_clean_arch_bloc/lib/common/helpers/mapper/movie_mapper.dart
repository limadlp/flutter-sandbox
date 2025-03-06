import 'package:movies_app_clean_arch_bloc/data/movie/models/movie_model.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
      //backdropPath: movie.backdropPath,
      overview: movie.overview,
      releaseDate: movie.releaseDate,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
      popularity: movie.popularity,
      adult: movie.adult,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      genreIds: movie.genreIds,
      video: movie.video,
      mediaType: movie.mediaType,
    );
  }
}
