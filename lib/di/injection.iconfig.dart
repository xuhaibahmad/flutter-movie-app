// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/utils/environment_info.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/bloc/movie/movie_bloc.dart';
import 'package:flutter_movie_app/views/delegates/movie_search_delegate.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  //Eager singletons must be registered in the right order
  final appRepository = await AppRepository.create();
  g.registerSingleton<AppRepository>(appRepository);
  final environmentInfoProvider = await EnvironmentInfoProvider.create();
  g.registerSingleton<EnvironmentInfoProvider>(environmentInfoProvider);
  final movieApi = await MovieApi.create(g<EnvironmentInfoProvider>());
  g.registerSingleton<MovieApi>(movieApi);
  g.registerSingleton<MovieRepository>(MovieRepository(g<MovieApi>()));
  g.registerSingleton<AppBloc>(AppBloc(g<AppRepository>()));
  g.registerSingleton<MovieBloc>(MovieBloc(repository: g<MovieRepository>()));
  g.registerSingleton<MovieSearchDelegate>(MovieSearchDelegate(g<MovieBloc>()));
}
