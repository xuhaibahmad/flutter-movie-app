import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

main() {
  MockAppRepository mockAppRepository;
  MockMovieRepository mockMovieRepository;

  setUpAll(() {
    mockAppRepository = MockAppRepository();
    mockMovieRepository = MockMovieRepository();
  });

  group('MovieSearchBloc', () {
    blocTest(
      'When nothing is added, then emit initial state',
      build: () async => MovieSearchBloc(
        appRepository: mockAppRepository,
        movieRepository: mockMovieRepository,
      ),
      skip: 0,
      expect: [isA<MovieSearchInitialState>()],
    );

    blocTest(
      'When movie search request is successful, then emit search result state',
      build: () async => MovieSearchBloc(
        appRepository: mockAppRepository,
        movieRepository: mockMovieRepository,
      ),
      act: (bloc) => bloc.add(SearchMoviesEvent("foo")),
      expect: [
        isA<MovieSearchLoadingState>(),
        isA<MovieSearchLoadedState>(),
      ],
    );

    blocTest(
      'When movie search request is failed, then emit search error state',
      build: () async {
        when(await mockMovieRepository.search(any, any)).thenThrow(Error());
        return MovieSearchBloc(
          appRepository: mockAppRepository,
          movieRepository: mockMovieRepository,
        );
      },
      act: (bloc) => bloc.add(SearchMoviesEvent("foo")),
      expect: [
        isA<MovieSearchLoadingState>(),
        isA<MovieSearchErrorState>(),
      ],
    );
  });
}
