import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/styling.dart';

class MovieListItemView extends StatelessWidget {
  final Function(int movieId) onItemClick;
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
      onTap: () => onItemClick(movie.id),
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

  Stack buildPoster(AppTheme theme) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 24),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isOffsetItem ? theme.offsetItemTint : theme.transparent,
                BlendMode.srcOver,
              ),
              child: movie.posterPath?.isNotEmpty ?? false
                  ? Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "$IMAGE_BASE_URL${movie.posterPath}",
                      ),
                    )
                  : Container(
                      width: 300,
                      height: 400,
                      child: Icon(
                        FlutterIcons.theater_masks_faw5s,
                        color: theme.darkMode ? Colors.white12 : Colors.black12,
                        size: 150,
                      ),
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
                onTap: () => onItemClick(movie.id),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
