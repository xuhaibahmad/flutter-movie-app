import 'package:mockito/mockito.dart';
import 'package:flutter_movie_app/data/app_repository.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';

class MockAppRepository extends Mock implements AppRepository {}

class MockMovieRepository extends Mock implements MovieRepository {}
