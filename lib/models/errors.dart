abstract class MovieError {
  final Error error;

  MovieError(this.error);
}

class MovieListError extends MovieError {
  MovieListError(Error error) : super(error);
}
