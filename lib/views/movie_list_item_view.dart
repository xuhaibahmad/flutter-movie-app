import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/clickable_mask_view.dart';
import 'package:flutter_movie_app/views/movie_poster_view.dart';

class MovieListItemView extends StatelessWidget {
  final Function(Item movie) onItemClick;
  final Item movie;
  final double rotation;
  final bool isOffsetItem;

  const MovieListItemView({
    Key key,
    @required this.movie,
    this.rotation,
    this.isOffsetItem,
    @required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = getIt<AppTheme>();
    return GestureDetector(
      onTap: () => onItemClick(movie),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(rotation),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPoster(theme),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.headline6,
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
      ),
    );
  }

  Widget buildPoster(AppTheme theme) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 24),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Hero(
            tag: movie,
            child: MoviePosterView(
              posterPath: movie.posterPath,
              icon: FlutterIcons.theater_masks_faw5s,
              iconSize: 100,
              cornerRadius: 50,
              width: 280,
              height: 370,
            ),
          ),
        ),
        ClickableMaskView(
          padding: 24,
          rippleColor: theme.transparent,
          onClick: () => onItemClick(movie),
          radius: 50,
        ),
      ],
    );
  }
}
