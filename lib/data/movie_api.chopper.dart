// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MovieApi extends MovieApi {
  _$MovieApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieApi;

  @override
  Future<Response<MovieListResponse>> getNowPlaying() {
    final $url = 'https://api.themoviedb.org/3/movie/now_playing';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }
}
