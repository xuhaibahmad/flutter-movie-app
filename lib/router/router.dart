import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_movie_app/screens/movie_list.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  MovieListScreen movieListPage;
}
