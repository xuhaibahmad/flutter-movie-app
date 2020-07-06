import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

@preResolve
@lazySingleton
class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState>
    with AutoResetLazySingleton<MovieSearchEvent, MovieSearchState> {
  final MovieRepository repository;

  MovieSearchBloc({this.repository}) : super(MovieSearchInitialState());

  @override
  Stream<MovieSearchState> mapEventToState(
    MovieSearchEvent event,
  ) async* {
    if (event is SearchMoviesEvent) {
      yield MovieSearchLoadingState();
      try {
        final response = await repository.search(event.query);
        final movies = MovieListViewModel.fromMovieResponse(response);
        yield MovieSearchLoadedState(movies);
      } on MovieSearchError catch (e) {
        yield MovieSearchErrorState(e);
      }
    }
  }
}
