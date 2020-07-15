import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
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

  group('MovieListBloc', () {
    blocTest(
      'When nothing is added, then emit initial state',
      build: () async => MovieListBloc(
        appRepository: mockAppRepository,
        movieRepository: mockMovieRepository,
      ),
      skip: 0,
      expect: [isA<MovieListInitialState>()],
    );

    blocTest(
      'When "Now Playing" movies request is successful, then emit movie list state',
      build: () async => MovieListBloc(
        appRepository: mockAppRepository,
        movieRepository: mockMovieRepository,
      ),
      act: (bloc) => bloc.add(GetNowPlayingMovieListEvent()),
      expect: [
        isA<MovieListLoadingState>(),
        isA<MovieListLoadedState>(),
      ],
    );

    blocTest(
      'When "Now Playing" movies request is failed, then emit movie error state',
      build: () async {
        when(await mockMovieRepository.getNowPlayingMovies())
            .thenThrow(Error());
        return MovieListBloc(
          appRepository: mockAppRepository,
          movieRepository: mockMovieRepository,
        );
      },
      act: (bloc) => bloc.add(GetNowPlayingMovieListEvent()),
      expect: [
        isA<MovieListLoadingState>(),
        isA<MovieListErrorState>(),
      ],
    );
  });
}
