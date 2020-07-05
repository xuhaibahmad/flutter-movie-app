// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenreListResponse _$_$_GenreListResponseFromJson(Map<String, dynamic> json) {
  return _$_GenreListResponse(
    genres: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_GenreListResponseToJson(
        _$_GenreListResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

_$_Genre _$_$_GenreFromJson(Map<String, dynamic> json) {
  return _$_Genre(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_GenreToJson(_$_Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
