import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_list_response.freezed.dart';
part 'genre_list_response.g.dart';

@freezed
abstract class GenreListResponse with _$GenreListResponse {
  @JsonSerializable()
  factory GenreListResponse({
    List<Genre> genres,
  }) = _GenreListResponse;

  factory GenreListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreListResponseFromJson(json);
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
