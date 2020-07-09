import 'package:flutter/material.dart';

class ClickableMaskView extends StatelessWidget {
  final Color rippleColor;
  final Function onClick;
  final double padding;
  final double radius;

  const ClickableMaskView({
    Key key,
    this.rippleColor,
    this.onClick,
    this.padding,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Material(
          color: rippleColor,
          child: InkWell(
            onTap: () => onClick(),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
