import 'package:flutter/cupertino.dart';

Widget customPaint({
  double? width,
  double? height,
  CustomPainter? painter,
}) =>
    CustomPaint(
      size: Size(width!, height!),
      painter: painter,
    );

Widget clipPath({
  CustomClipper<Path>? clipper,
  Widget? child,
}) =>
    ClipPath(
      clipper: clipper,
      child: child,
    );
