part of 'app_bloc.dart';

@immutable
abstract class AppState {
  AppState();
}

class AppInitialState extends AppState {}

class AppInitializedState extends AppState {}

class SectionChangedState extends AppState {}
