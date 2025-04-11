import 'package:movies_app_clean_arch_bloc/data/tv/models/tv_model.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/entities/tv_entity.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tvmodel) {
    return TvEntity(
      id: tvmodel.id,
      name: tvmodel.name,
      posterPath: tvmodel.posterPath,
      backdropPath: tvmodel.backdropPath,
      overview: tvmodel.overview,
      firstAirDate: tvmodel.firstAirDate,
      voteAverage: tvmodel.voteAverage,
      voteCount: tvmodel.voteCount,
      popularity: tvmodel.popularity,
      adult: tvmodel.adult,
      originalLanguage: tvmodel.originalLanguage,
      originalName: tvmodel.originalName,
      genreIds: tvmodel.genreIds,
      originCountry: tvmodel.originCountry,
    );
  }
}
