import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/clickable_mask_view.dart';
import 'package:flutter_movie_app/views/movie_poster_view.dart';
import 'package:flutter_movie_app/utils/extensions/time_ext.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieContentView extends StatefulWidget {
  final AppTheme theme;
  final MovieDetailsResponse movie;

  const MovieContentView({
    Key key,
    @required this.theme,
    @required this.movie,
  }) : super(key: key);

  @override
  _MovieContentViewState createState() => _MovieContentViewState();
}

class _MovieContentViewState extends State<MovieContentView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(milliseconds: 500);
    controller = AnimationController(
      duration: duration,
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: Offset.fromDirection(0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));
    Future.delayed(duration, () => controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (_, state) {
        if (state is MovieDetailsLoadedState) {
          return buildMovieDetails(state);
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildMovieDetails(MovieDetailsLoadedState state) {
    final movie = state.detailsViewModel.movie;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 250.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              buildContent(movie),
              const SizedBox(height: 12),
              buildSimilarMoviesList(state.similarViewModel),
              const SizedBox(height: 12),
            ],
          ),
        ),
        SlideTransition(
          position: animation,
          child: Container(
            height: 80,
            margin: const EdgeInsets.only(top: 210, left: 40),
            child: Card(
              color: widget.theme.darkMode ? Colors.black : Colors.white,
              shadowColor: widget.theme.textColorDark,
              margin: const EdgeInsets.all(0),
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(50),
                  topLeft: const Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 48),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildRating(),
                    buildAdultWarning(),
                    buildWatchLink(movie),
                    buildImdbLink(movie),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContent(MovieDetailsResponse movie) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: widget.theme.headline6),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                movie.releaseDate.split("-").first ?? "-",
                style: widget.theme.bodyText1,
              ),
              const SizedBox(width: 20),
              Text(
                movie.originalLanguage.toUpperCase() ?? "-",
                style: widget.theme.bodyText1,
              ),
              const SizedBox(width: 20),
              Text(
                movie.runtime.getTimeString() ?? "-",
                style: widget.theme.bodyText1,
              ),
            ],
          ),
          const SizedBox(height: 8),
          buildGenres(movie.genres),
          const SizedBox(height: 20),
          Text("Plot Summary", style: widget.theme.headline1),
          const SizedBox(height: 12),
          Text(
            movie.overview,
            style: widget.theme.caption,
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
              backgroundColor: widget.theme.transparent,
              label: Text(
                item.name,
                style: widget.theme.bodyText1.copyWith(
                  color: widget.theme.textColorDark,
                ),
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: widget.theme.textColorLight,
                  width: .8,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildAdultWarning() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        color: widget.movie.adult ? Colors.red : Colors.grey,
        height: 40,
        width: 40,
        child: Text(
          "18",
          style: widget.theme.headline6
              .copyWith(color: widget.theme.backgroundLightColor),
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

  Widget buildRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FlutterIcons.star_ant,
          size: 24,
          color: widget.theme.amber,
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${widget.movie.voteAverage}",
              style: widget.theme.caption
                  .copyWith(color: widget.theme.textColorDark),
            ),
            const SizedBox(width: 2),
            Text(
              "/",
              style: widget.theme.bodyText1
                  .copyWith(color: widget.theme.textColor),
            ),
            Text(
              "10",
              style: widget.theme.bodyText1
                  .copyWith(color: widget.theme.textColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSimilarMoviesList(MovieListViewModel similarMovies) {
    return similarMovies.results.isEmpty
        ? Container()
        : Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text("Similar Movies", style: widget.theme.headline1),
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
                        padding: const EdgeInsets.all(8),
                        child: buildSimilarMovieItem(context, item),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget buildSimilarMovieItem(BuildContext context, Item movie) {
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
                margin: const EdgeInsets.symmetric(horizontal: 24),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MoviePosterView(
                  posterPath: movie.posterPath,
                  icon: FlutterIcons.theater_masks_faw5s,
                  iconSize: 100,
                  cornerRadius: 15,
                  width: 150,
                  height: 200,
                  freeImage: true,
                ),
              ),
              ClickableMaskView(
                padding: 24,
                rippleColor: widget.theme.transparent,
                onClick: () => openDetails(context, movie),
                radius: 15,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: widget.theme.headline1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FlutterIcons.star_ant,
                size: 16,
                color: widget.theme.amber,
              ),
              const SizedBox(width: 8),
              Text(
                "${movie.voteAverage}",
                style: widget.theme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }

  openDetails(BuildContext context, Item movie) {
    ExtendedNavigator.of(context).pushReplacementNamed(
      Routes.movieDetailsPage,
      arguments: MovieDetailsScreenArguments(movie: movie),
    );
  }

  openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
