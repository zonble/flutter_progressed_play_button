library flutter_progressed_play_button;

/// A simple Flutter widget that presents a "play button" with a progress drawn as
/// an arc around the icon.

import 'dart:math';
import 'package:flutter/material.dart';

/// A simple Flutter widget that presents a "play button" with a progress drawn as
/// an arc around the icon.
///
/// The widget has two state. You can decide to draw the progress or not by
/// specifying the [showProgress] property.
///
/// When you wan to show the progress, just set it to the [progress] property. The
/// values could range from 0.0 to 1.0.
class ProgressedPlayButton extends StatelessWidget {
  /// Handles tap events.

  final VoidCallback onPressed;

  /// The progress, 0.0 to 1.0.
  final double progress;

  /// Size of the icon.
  final double iconSize;

  /// To show progress or not.
  final bool showProgress;

  /// The color for the icon.
  final Color iconColor;

  /// The color for the background.
  final Color backgroundColor;

  /// The tooltip.
  final tooltip;

  /// Creates a new instance.
  ProgressedPlayButton({
    Key key,
    this.showProgress = false,
    this.progress = 1.0,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.tooltip,
  }) : super(key: key);

  Color _backgroundColor(context) =>
      backgroundColor ?? Theme.of(context).primaryColor;

  Color _iconColor(context) => iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          onTap: this.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomPaint(
              painter: _Painter(
                showProgress: this.showProgress,
                progress: this.progress,
                iconColor: _iconColor(context),
                backgroundColor: _backgroundColor(context),
              ),
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  size: iconSize,
                  semanticLabel: tooltip,
                  color: this.showProgress
                      ? _backgroundColor(context)
                      : _iconColor(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final bool showProgress;
  final double progress;
  final Color backgroundColor;
  final Color iconColor;

  _Painter({
    this.showProgress,
    this.progress,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    if (!showProgress) {
      Paint fill = Paint()
        ..color = backgroundColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 2;
      canvas.drawCircle(center, radius, fill);
      return;
    }

    Paint line = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, line);

    line.color = this.backgroundColor;

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
