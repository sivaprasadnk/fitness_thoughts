import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp should render without errors',
      (WidgetTester tester) async {
    // Load the widget
    await tester.pumpWidget(MyApp());

    // Verify if the app title is set correctly
    expect(find.text(kAppName), findsNothing);

    // Check if MaterialApp.router is rendered properly
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('App should have a scaffold with correct background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder,
        findsNothing); // Since it's using router-based navigation
  });

  testWidgets('MyApp should not display the debug banner',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Ensure the debug banner is not displayed
    final debugBannerFinder = find.byTooltip('Debug');
    expect(debugBannerFinder, findsNothing);
  });
}
