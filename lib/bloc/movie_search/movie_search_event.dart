part of 'movie_search_bloc.dart';

@immutable
abstract class MovieSearchEvent {}

class SearchMoviesEvent extends MovieSearchEvent {
  final String query;

  SearchMoviesEvent(this.query);
}
