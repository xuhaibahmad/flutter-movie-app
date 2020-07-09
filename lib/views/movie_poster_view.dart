import 'package:flutter/material.dart';
import 'package:flutter_movie_app/views/safe_image_view.dart';

class MoviePosterView extends StatelessWidget {
  final String posterPath;
  final double cornerRadius;
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final bool freeImage;

  const MoviePosterView({
    Key key,
    @required this.posterPath,
    this.cornerRadius = 4,
    this.width = 40,
    this.height = 60,
    @required this.icon,
    @required this.iconSize,
    this.freeImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: SafeImageView(
        path: this.posterPath,
        width: this.width,
        height: this.height,
        icon: this.icon,
        iconSize: this.iconSize,
        freeImage: this.freeImage,
      ),
    );
  }
}
