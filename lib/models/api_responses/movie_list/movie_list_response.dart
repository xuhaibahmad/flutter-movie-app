import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_response.freezed.dart';
part 'movie_list_response.g.dart';

@freezed
abstract class MovieListResponse with _$MovieListResponse {
  @JsonSerializable()
  factory MovieListResponse({
    @JsonKey(name: "results") List<Item> results,
    @JsonKey(name: "page") int page,
    @JsonKey(name: "total_results") int totalResults,
    @JsonKey(name: "dates") Dates dates,
    @JsonKey(name: "total_pages") int totalPages,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}

@freezed
abstract class Dates with _$Dates {
  @JsonSerializable()
  factory Dates({
    @JsonKey(name: "maximum") String maximum,
    @JsonKey(name: "minimum") String minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
abstract class Item with _$Item {
  @JsonSerializable()
  factory Item({
    @JsonKey(name: "popularity") double popularity,
    @JsonKey(name: "voteCount") int voteCount,
    @JsonKey(name: "video") bool video,
    @JsonKey(name: "poster_path") String posterPath,
    @JsonKey(name: "id") int id,
    @JsonKey(name: "adult") bool adult,
    @JsonKey(name: "backdrop_path") String backdropPath,
    @JsonKey(name: "original_language") String originalLanguage,
    @JsonKey(name: "original_title") String originalTitle,
    @JsonKey(name: "genre_ids") List<int> genreIds,
    @JsonKey(name: "title") String title,
    @JsonKey(name: "vote_average") double voteAverage,
    @JsonKey(name: "overview") String overview,
    @JsonKey(name: "release_date") String releaseDate,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
