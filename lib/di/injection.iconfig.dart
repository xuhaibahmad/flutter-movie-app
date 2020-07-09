// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/utils/environment_info.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/di/modules/app_module.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
import 'package:flutter_movie_app/views/delegates/movie_search_delegate.dart';
import 'package:flutter_movie_app/screens/settings.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final appModule = _$AppModule();
  g.registerLazySingleton<MovieSearchBloc>(
      () => MovieSearchBloc(g<AppRepository>(), g<MovieRepository>()));
  g.registerFactory<bool>(() => appModule.darkModeEnabled,
      instanceName: 'dark_mode');
  g.registerLazySingleton<MovieDetailsBloc>(
      () => MovieDetailsBloc(repository: g<MovieRepository>()));
  g.registerLazySingleton<MovieListBloc>(() => MovieListBloc(
      appRepository: g<AppRepository>(),
      movieRepository: g<MovieRepository>()));
  g.registerFactory<SettingsSheet>(() => SettingsSheet(g<AppTheme>()));

  //Eager singletons must be registered in the right order
  final appRepository = await AppRepository.create();
  g.registerSingleton<AppRepository>(appRepository);
  final environmentInfoProvider = await EnvironmentInfoProvider.create();
  g.registerSingleton<EnvironmentInfoProvider>(environmentInfoProvider);
  final movieApi = await MovieApi.create(g<EnvironmentInfoProvider>());
  g.registerSingleton<MovieApi>(movieApi);
  g.registerSingleton<MovieRepository>(MovieRepository(g<MovieApi>()));
  g.registerSingleton<AppBloc>(AppBloc(g<AppRepository>()));
  g.registerSingleton<AppTheme>(
      AppTheme.create(g<bool>(instanceName: 'dark_mode')));
  g.registerSingleton<MovieSearchDelegate>(
      MovieSearchDelegate(g<AppTheme>(), g<MovieSearchBloc>()));
}

class _$AppModule extends AppModule {}
