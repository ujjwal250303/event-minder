import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_minder/main.dart';

void main() {
  testWidgets('Splash Screen loads with Event Minder text', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the splash screen loads and "Event Minder" text is present.
    expect(find.text('Event Minder'), findsOneWidget);

    // Commenting navigation test for now to debug splash screen
    // await tester.pumpAndSettle(const Duration(seconds: 4));
    // expect(find.text('Welcome Back!'), findsOneWidget);
  });
}