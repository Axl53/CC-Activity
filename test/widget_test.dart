// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dartact/main.dart';

void main() {
  testWidgets('shows posts returned by the API fetcher', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(
          fetchPosts: () async => const [
            Post(id: 1, title: 'Test title', body: 'Test body'),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Latest posts'), findsOneWidget);
    expect(find.text('Test title'), findsOneWidget);
    expect(find.text('Test body'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
