import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/utils/api_key_interceptor.dart';
import 'package:flutter_movie_app/utils/chopper_json_converter.dart';
import 'package:flutter_movie_app/utils/environment_info.dart';
import 'package:injectable/injectable.dart';

part "movie_api.chopper.dart";

const BASE_URL = 'https://api.themoviedb.org/3';
const API_KEY = 'TMDB_API_KEY';

@singleton
@preResolve
@ChopperApi(baseUrl: BASE_URL)
abstract class MovieApi extends ChopperService {
  @Get(path: "/movie/now_playing")
  Future<Response<MovieListResponse>> getNowPlaying();

  @factoryMethod
  static Future<MovieApi> create(EnvironmentInfoProvider env) async {
    final apiKey = env.getEnvVariable(API_KEY);
    final client = ChopperClient(
      services: [_$MovieApi()],
      converter: JsonToTypeConverter({
        MovieListResponse: (json) => MovieListResponse.fromJson(json),
      }),
      interceptors: [
        ApiKeyInterceptor(apiKey: apiKey),
        HttpLoggingInterceptor(),
      ],
    );

    return _$MovieApi(client);
  }
}
