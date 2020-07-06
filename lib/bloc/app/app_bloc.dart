import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

@preResolve
@singleton
class AppBloc extends Bloc<AppEvent, AppState>
    with AutoResetLazySingleton<AppEvent, AppState> {
  final AppRepository repository;

  AppBloc(this.repository) : super(getInitialState(repository));

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is GetPreferenceEvent) {
      yield getPreferencesState();
    } else if (event is UpdateNightModeEvent) {
      await repository.updateNightMode(event.value);
      yield getPreferencesState();
    } else if (event is UpdateContentFilterEvent) {
      await repository.updateContentFilter(event.value);
      yield getPreferencesState();
    }
  }

  static AppInitialState getInitialState(AppRepository repository) {
    return AppInitialState(
      nightModeEnabled: repository.nightModeEnabled,
      contentFilterEnabled: repository.contentFilterEnabled,
    );
  }

  PreferenceUpdatedState getPreferencesState() {
    return PreferenceUpdatedState(
      nightModeEnabled: repository.nightModeEnabled,
      contentFilterEnabled: repository.contentFilterEnabled,
    );
  }
}
