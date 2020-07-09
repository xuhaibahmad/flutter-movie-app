import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:flutter_movie_app/utils/extensions/time_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  final int movieId;

  const MovieDetailsScreen({Key key, @required this.movieId}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState(
        movieId: movieId,
        theme: getIt<AppTheme>(),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<MovieDetailsBloc>(),
        child: this,
      );
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final AppTheme theme;
  final int movieId;
  MovieDetailsBloc bloc;

  _MovieDetailsScreenState({this.movieId, this.theme});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= BlocProvider.of<MovieDetailsBloc>(context)
      ..add(GetMovieDetailsEvent(movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Material(
              color: Colors.black26,
              child: InkWell(
                splashColor: Colors.white60,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    FlutterIcons.navigate_before_mdi,
                    size: 24,
                  ),
                ),
                onTap: () => ExtendedNavigator.of(context).pop(),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (_, state) {
          if (state is MovieDetailsLoadedState) {
            return buildMovieDetails(state);
          } else if (state is MovieDetailsErrorState) {
            return ErrorView();
          } else {
            return ProgressView();
          }
        },
      ),
    );
  }

  Widget buildMovieDetails(MovieDetailsLoadedState state) {
    final movie = state.viewModel.movie;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildBanner(movie),
                SizedBox(height: 100),
                buildContent(movie),
                SizedBox(height: 12),
                buildSimilarMoviesList(state.viewModel.similarMovies),
                SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            height: 80,
            margin: EdgeInsets.only(top: 210, left: 40),
            child: Card(
              color: theme.darkMode ? Colors.black : Colors.white,
              shadowColor: theme.textColorDark,
              margin: EdgeInsets.all(0),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 48),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildRating(movie),
                    buildAdultWarning(movie),
                    buildWatchLink(movie),
                    buildImdbLink(movie),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(MovieDetailsResponse movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: theme.headline6),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                movie.releaseDate.split("-").first ?? "-",
                style: theme.bodyText1,
              ),
              SizedBox(width: 20),
              Text(
                movie.originalLanguage.toUpperCase() ?? "-",
                style: theme.bodyText1,
              ),
              SizedBox(width: 20),
              Text(
                movie.runtime.getTimeString() ?? "-",
                style: theme.bodyText1,
              ),
            ],
          ),
          SizedBox(height: 8),
          buildGenres(movie.genres),
          SizedBox(height: 20),
          Text("Plot Summary", style: theme.headline1),
          SizedBox(height: 12),
          Text(
            movie.overview,
            style: theme.caption,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget buildGenres(List<Genre> genres) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: genres.length,
        itemBuilder: (BuildContext context, int index) {
          final item = genres[index];
          return Container(
            padding: EdgeInsets.only(right: 8),
            child: Chip(
              backgroundColor: theme.transparent,
              label: Text(
                item.name,
                style: theme.bodyText1.copyWith(
                  color: theme.textColorDark,
                ),
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: theme.textColorLight,
                  width: .8,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBanner(MovieDetailsResponse movie) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: movie.backdropPath?.isNotEmpty ?? false
          ? Image(
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              height: 250,
              image: NetworkImage("$IMAGE_BASE_URL${movie.backdropPath}"),
            )
          : Container(
              width: 150,
              height: 250,
              child: Icon(
                FlutterIcons.theater_masks_faw5s,
                color: theme.darkMode ? Colors.white12 : Colors.black12,
                size: 150,
              ),
            ),
    );
  }

  Widget buildAdultWarning(MovieDetailsResponse movie) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        color: movie.adult ? Colors.red : Colors.grey,
        height: 40,
        width: 40,
        child: Text(
          "18",
          style: theme.headline6.copyWith(color: theme.backgroundLightColor),
        ),
      ),
    );
  }

  Widget buildImdbLink(MovieDetailsResponse movie) {
    return IconButton(
      icon: Icon(
        FlutterIcons.imdb_faw,
        color: movie.imdbId.isNotEmpty ? Colors.yellow : Colors.grey,
        size: 40,
      ),
      onPressed: () => openLink("$IMDB_BASE_URL${movie.imdbId}"),
    );
  }

  Widget buildWatchLink(MovieDetailsResponse movie) {
    return IconButton(
      icon: Icon(
        FlutterIcons.netflix_mco,
        color: movie.homepage.isNotEmpty ? Colors.red : Colors.grey,
        size: 40,
      ),
      onPressed: () => openLink(movie.homepage),
    );
  }

  Widget buildRating(MovieDetailsResponse movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FlutterIcons.star_ant,
          size: 24,
          color: theme.amber,
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${movie.voteAverage}",
              style: theme.caption.copyWith(color: theme.textColorDark),
            ),
            SizedBox(width: 2),
            Text(
              "/",
              style: theme.bodyText1.copyWith(color: theme.textColor),
            ),
            Text(
              "10",
              style: theme.bodyText1.copyWith(color: theme.textColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSimilarMoviesList(MovieListResponse similarMovies) {
    return similarMovies.results.isEmpty
        ? Container()
        : Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Similar Movies", style: theme.headline1),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: similarMovies.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = similarMovies.results[index];
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: buildSimilarMovieItem(item),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  buildSimilarMovieItem(Item movie) {
    return Container(
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 24),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: movie.posterPath?.isNotEmpty ?? false
                      ? Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "$IMAGE_BASE_URL${movie.posterPath}",
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 200,
                          child: Icon(
                            FlutterIcons.theater_masks_faw5s,
                            color: theme.darkMode
                                ? Colors.white12
                                : Colors.black12,
                            size: 150,
                          ),
                        ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Material(
                    color: theme.transparent,
                    child: InkWell(
                      onTap: () => openDetails(movie.id),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.headline1,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FlutterIcons.star_ant,
                size: 16,
                color: theme.amber,
              ),
              SizedBox(width: 8),
              Text(
                "${movie.voteAverage}",
                style: theme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }

  openDetails(int movieId) {
    ExtendedNavigator.of(context).pushNamed(
      Routes.movieDetailsPage,
      arguments: MovieDetailsScreenArguments(movieId: movieId),
    );
  }

  openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
