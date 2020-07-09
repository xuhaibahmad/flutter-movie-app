import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/styling.dart';

class SafeImageView extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final bool freeImage;

  SafeImageView({
    Key key,
    this.path,
    this.width,
    this.height,
    this.icon,
    this.iconSize = 32,
    this.freeImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = getIt<AppTheme>();
    return path?.isNotEmpty ?? false
        ? CachedNetworkImage(
            imageUrl: "$IMAGE_BASE_URL$path",
            width: freeImage ? null : this.width,
            height: freeImage ? null : this.height,
            fit: BoxFit.fill,
            placeholder: (_, url) => buildIcon(icon, theme),
            errorWidget: (_, url, e) => buildIcon(Icons.error, theme),
          )
        : Container(
            width: this.width,
            height: this.height,
            child: Icon(
              icon,
              color: theme.darkMode ? Colors.white12 : Colors.black12,
              size: this.iconSize,
            ),
          );
  }

  Widget buildIcon(IconData icon, AppTheme theme) {
    return Center(
      child: Icon(
        icon,
        color: theme.darkMode ? Colors.white12 : Colors.black12,
        size: this.iconSize,
      ),
    );
  }
}
