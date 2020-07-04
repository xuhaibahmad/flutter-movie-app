// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  g.registerLazySingleton<AppBloc>(() => AppBloc(g<AppRepository>()));

  //Eager singletons must be registered in the right order
  final appRepository = await AppRepository.create();
  g.registerSingleton<AppRepository>(appRepository);
}
