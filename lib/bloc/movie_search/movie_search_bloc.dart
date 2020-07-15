import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
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
  final AppRepository appRepository;
  final MovieRepository movieRepository;

  MovieSearchBloc({
    this.appRepository,
    this.movieRepository,
  }) : super(MovieSearchInitialState());

  @override
  Stream<MovieSearchState> mapEventToState(
    MovieSearchEvent event,
  ) async* {
    if (event is SearchMoviesEvent) {
      yield MovieSearchLoadingState();
      try {
        final movies = await movieRepository.search(
          event.query,
          appRepository.contentFilterEnabled,
        );
        yield MovieSearchLoadedState(movies);
      } on Error catch (e) {
        yield MovieSearchErrorState(e);
      }
    }
  }
}
