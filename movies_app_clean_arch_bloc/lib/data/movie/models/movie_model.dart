// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieModel {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final bool? video;
  final String? mediaType;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.video,
    required this.mediaType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'popularity': popularity,
      'adult': adult,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'genreIds': genreIds,
      'video': video,
      'mediaType': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      posterPath:
          map['posterPath'] != null ? map['posterPath'] as String : null,
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      voteAverage:
          map['voteAverage'] != null ? map['voteAverage'] as double : null,
      voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,
      adult: map['adult'] != null ? map['adult'] as bool : null,
      originalLanguage:
          map['originalLanguage'] != null
              ? map['originalLanguage'] as String
              : null,
      originalTitle:
          map['originalTitle'] != null ? map['originalTitle'] as String : null,
      genreIds:
          map['genreIds'] != null ? List<int>.from(map['genreIds']) : null,
      video: map['video'] != null ? map['video'] as bool : null,
      mediaType: map['mediaType'] != null ? map['mediaType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
