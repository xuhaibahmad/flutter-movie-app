part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final bool nightModeEnabled;
  final bool contentFilterEnabled;

  AppState(this.nightModeEnabled, this.contentFilterEnabled);
}

class AppInitialState extends AppState {
  AppInitialState({
    @required bool nightModeEnabled,
    @required bool contentFilterEnabled,
  }) : super(nightModeEnabled, contentFilterEnabled);
}

class PreferenceUpdatedState extends AppState {
  PreferenceUpdatedState({
    @required bool nightModeEnabled,
    @required bool contentFilterEnabled,
  }) : super(nightModeEnabled, contentFilterEnabled);
}
