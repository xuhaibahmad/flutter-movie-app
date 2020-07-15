import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAppRepository extends Mock implements AppRepository {}

main() {
  MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
  });

  group('AppBloc', () {
    blocTest(
      'emits AppInitialState when nothing is added',
      build: () async {
        when(mockRepository.nightModeEnabled).thenReturn(false);
        when(mockRepository.contentFilterEnabled).thenReturn(false);
        return AppBloc(mockRepository);
      },
      skip: 0,
      expect: [
        AppInitialState(
          nightModeEnabled: false,
          contentFilterEnabled: false,
        )
      ],
    );

    blocTest(
      'emits PreferenceState when GetPreferenceEvent is added',
      build: () async {
        when(mockRepository.nightModeEnabled).thenReturn(true);
        when(mockRepository.contentFilterEnabled).thenReturn(false);
        return AppBloc(mockRepository);
      },
      act: (bloc) => bloc.add(GetPreferenceEvent()),
      expect: [
        PreferenceState(
          nightModeEnabled: true,
          contentFilterEnabled: false,
        )
      ],
    );
  });
}
