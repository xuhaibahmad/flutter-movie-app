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
        ? Image(
            width: freeImage ? null : this.width,
            height: freeImage ? null : this.height,
            fit: BoxFit.fill,
            image: NetworkImage("$IMAGE_BASE_URL$path"),
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
}
