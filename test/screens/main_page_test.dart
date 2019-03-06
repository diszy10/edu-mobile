import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:edukasi_mobile/screens/main_page.dart';

import '../mock_image.dart';

void main() {
  setUp(() async {
    /// Override Image.Network Call
    io.HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('Navigation bar test', (WidgetTester tester) async {
    Widget mainPageTest = MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: MainPage()));
    // Build our app and trigger a frame.
    await tester.pumpWidget(mainPageTest);

    // Verify Activities tab
    await tester.tap(find.byIcon(Icons.view_stream));
    await tester.pump();

    expect(find.text('Activities'), findsOneWidget);

    // Verify Classes tab
    await tester.tap(find.byIcon(Icons.people_outline));
    await tester.pump();

    expect(find.text('Classes'), findsOneWidget);

    // Verify Messages tab
    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pump();

    expect(find.text('Messages'), findsOneWidget);

    // Verify Notifications tab
    await tester.tap(find.byIcon(Icons.notifications_none));
    await tester.pump();

    expect(find.text('Notifications'), findsOneWidget);

    // Verify Profile tab
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pump();

    expect(find.text('My Profile'), findsOneWidget);
  });
}
