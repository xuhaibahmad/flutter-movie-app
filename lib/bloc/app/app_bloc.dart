import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState>
    with AutoResetLazySingleton<AppEvent, AppState> {
  final AppRepository repository;

  AppBloc(this.repository);

  @override
  AppState get initialState => AppInitialState();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {}
}
