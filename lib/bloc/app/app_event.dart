part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class GetPreferenceEvent extends AppEvent {}

class UpdateNightModeEvent extends AppEvent {
  final bool value;

  UpdateNightModeEvent(this.value);
}

class UpdateContentFilterEvent extends AppEvent {
  final bool value;

  UpdateContentFilterEvent(this.value);
}
