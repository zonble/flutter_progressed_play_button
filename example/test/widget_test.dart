// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_progressed_play_button/flutter_progressed_play_button.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('ProgressedPlayButton demo smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the demo app loads with expected content.
    expect(find.text('flutter_progressed_play_button Demo'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    
    // Verify that ProgressedPlayButton widgets are present.
    expect(find.byType(ProgressedPlayButton), findsWidgets);
    
    // Test that the slider for progress works.
    expect(find.byType(Slider), findsOneWidget);
  });
}
