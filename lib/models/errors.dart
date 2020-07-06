abstract class MovieError {
  final Error error;

  MovieError(this.error);
}

class MovieListError extends MovieError {
  MovieListError(Error error) : super(error);
}

class MovieDetailsError extends MovieError {
  MovieDetailsError(Error error) : super(error);
}

class MovieSearchError extends MovieError {
  MovieSearchError(Error error) : super(error);
}
