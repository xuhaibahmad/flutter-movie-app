import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.freezed.dart';
part 'movie_details_response.g.dart';

@freezed
abstract class MovieDetailsResponse with _$MovieDetailsResponse {
  @JsonSerializable()
  factory MovieDetailsResponse({
    bool adult,
    int budget,
    List<Genre> genres,
    String homepage,
    int id,
    String overview,
    double popularity,
    int revenue,
    int runtime,
    String status,
    String tagline,
    String title,
    bool video,
    @JsonKey(name: "backdrop_path") String backdropPath,
    @JsonKey(name: "belongs_to_collection") dynamic belongsToCollection,
    @JsonKey(name: "imdb_id") String imdbId,
    @JsonKey(name: "original_language") String originalLanguage,
    @JsonKey(name: "original_title") String originalTitle,
    @JsonKey(name: "poster_path") String posterPath,
    @JsonKey(name: "production_companies") List<ProductionCompany> companies,
    @JsonKey(name: "production_countries") List<ProductionCountry> countries,
    @JsonKey(name: "release_date") String releaseDate,
    @JsonKey(name: "spoken_languages") List<SpokenLanguage> spokenLanguages,
    @JsonKey(name: "vote_average") double voteAverage,
    @JsonKey(name: "vote_count") int voteCount,
  }) = _MovieDetailsResponse;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  @JsonSerializable()
  factory Genre({
    int id,
    String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  @JsonSerializable()
  factory ProductionCompany({
    int id,
    String name,
    @JsonKey(name: "logo_path") String logoPath,
    @JsonKey(name: "origin_country") String originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  @JsonSerializable()
  factory ProductionCountry({
    String name,
    @JsonKey(name: "iso_3166_1") String iso31661,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  @JsonSerializable()
  factory SpokenLanguage({
    String name,
    @JsonKey(name: "iso_639_1") String iso6391,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
