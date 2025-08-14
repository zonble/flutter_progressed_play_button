import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_progressed_play_button/flutter_progressed_play_button.dart';

void main() {
  group('ProgressedPlayButton', () {
    testWidgets('creates widget with default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgressedPlayButton(),
          ),
        ),
      );

      expect(find.byType(ProgressedPlayButton), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('displays progress when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgressedPlayButton(
              showProgress: true,
              progress: 0.5,
            ),
          ),
        ),
      );

      expect(find.byType(ProgressedPlayButton), findsOneWidget);
    });

    testWidgets('handles tap callback', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgressedPlayButton(
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ProgressedPlayButton));
      expect(tapped, isTrue);
    });

    testWidgets('accepts custom icon and colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgressedPlayButton(
              icon: Icons.pause,
              iconColor: Colors.red,
              backgroundColor: Colors.blue,
              iconSize: 48.0,
              tooltip: 'Test tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(ProgressedPlayButton), findsOneWidget);
    });
  });
}