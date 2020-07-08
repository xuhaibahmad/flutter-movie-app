import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:flutter_movie_app/utils/time_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  final int movieId;

  const MovieDetailsScreen({
    Key key,
    @required this.movieId,
  }) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState(
        movieId,
        getIt<AppTheme>(),
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

  _MovieDetailsScreenState(this.movieId, this.theme);

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
              children: [
                buildBanner(movie),
                SizedBox(height: 100),
                buildContent(movie),
              ],
            ),
          ),
          Container(
            height: 80,
            margin: EdgeInsets.only(top: 210, left: 40),
            child: Card(
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
          SizedBox(height: 16),
          Text("Plot Summary", style: theme.headline1),
          SizedBox(height: 12),
          Text(movie.overview, style: theme.caption),
          // TODO: Add similar movies
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
      child: Image(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        height: 250,
        image: NetworkImage("$IMAGE_BASE_URL${movie.backdropPath}"),
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
      children: <Widget>[
        Icon(
          FlutterIcons.star_ant,
          size: 24,
          color: theme.amber,
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "${movie.voteAverage}",
              style: theme.caption,
            ),
            Text(
              "/10",
              style: theme.bodyText1,
            ),
          ],
        ),
      ],
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
