part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  final bool nightModeEnabled;
  final bool contentFilterEnabled;

  AppState(this.nightModeEnabled, this.contentFilterEnabled);
}

@immutable
class AppInitialState extends AppState {
  AppInitialState({
    @required bool nightModeEnabled,
    @required bool contentFilterEnabled,
  }) : super(nightModeEnabled, contentFilterEnabled);

  @override
  List<Object> get props => [nightModeEnabled, contentFilterEnabled];
}

@immutable
class PreferenceState extends AppState {
  PreferenceState({
    @required bool nightModeEnabled,
    @required bool contentFilterEnabled,
  }) : super(nightModeEnabled, contentFilterEnabled);

  @override
  List<Object> get props => [nightModeEnabled, contentFilterEnabled];
}
