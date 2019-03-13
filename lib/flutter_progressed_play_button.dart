library flutter_progressed_play_button;

import 'dart:math';
import 'package:flutter/material.dart';

class ProgressedPlayButton extends StatelessWidget {
  /// Handles tap events.
  final VoidCallback onPressed;

  /// The progress, 0.0 to 1.0.
  final double progress;

  /// To show the progress or not.
  final bool showProgress;

  /// The color for the icon.
  final Color iconColor;

  /// The color for the background.
  final Color backgroundColor;

  /// Creates a new instance.
  ProgressedPlayButton({
    Key key,
    this.showProgress = false,
    this.progress = 1.0,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
  }) : super(key: key);

  Color _backgroundColor(context) =>
      iconColor ?? Theme.of(context).primaryColor;

  Color _iconColor(context) => iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    if (this.showProgress == true) {
      return ClipOval(
        child: Material(
          child: InkWell(
            onTap: this.onPressed,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomPaint(
                painter: _Painter(
                  progress: this.progress,
                  color: _backgroundColor(context),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.play_arrow,
                    color: _backgroundColor(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return RaisedButton(
      padding: EdgeInsets.all(4.0),
      shape: CircleBorder(),
      onPressed: onPressed,
      elevation: 0,
      highlightElevation: 0,
      color: _backgroundColor(context),
      child: Icon(
        Icons.play_arrow,
        color: _iconColor(context),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final double progress;
  final Color color;

  _Painter({this.progress, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);

    line.color = this.color;

    var progress = () {
      if (this.progress < 0.0) {
        return 0.0;
      } else if (this.progress > 1.0) {
        return 1.0;
      }
      return this.progress;
    }();

    var arcAngle = 2 * pi * progress;
    var rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, -pi / 2, arcAngle, false, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
