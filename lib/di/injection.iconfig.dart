// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/utils/environment_info.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  g.registerLazySingleton<AppBloc>(() => AppBloc(g<AppRepository>()));
  g.registerLazySingleton<MovieListBloc>(
      () => MovieListBloc(repository: g<MovieRepository>()));

  //Eager singletons must be registered in the right order
  final appRepository = await AppRepository.create();
  g.registerSingleton<AppRepository>(appRepository);
  final environmentInfoProvider = await EnvironmentInfoProvider.create();
  g.registerSingleton<EnvironmentInfoProvider>(environmentInfoProvider);
  final movieApi = await MovieApi.create(g<EnvironmentInfoProvider>());
  g.registerSingleton<MovieApi>(movieApi);
  g.registerSingleton<MovieRepository>(MovieRepository(g<MovieApi>()));
}
