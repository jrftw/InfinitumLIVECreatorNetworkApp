// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinitum_live_creator_network/services/terms_acceptance_service.dart';
import 'package:infinitum_live_creator_network/screens/terms_acceptance_screen.dart';

import 'package:infinitum_live_creator_network/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Mirror normal startup prerequisites without invoking ads or network services.
    SharedPreferences.setMockInitialValues({});
    await TermsAcceptanceService.initialize();

    // Build our app and trigger a frame.
    await tester.pumpWidget(const InfinitumLiveApp());

    // Verify that the app builds without errors
    expect(find.byType(MaterialApp), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(TermsAcceptanceScreen), findsOneWidget);
    expect(TermsAcceptanceService.termsAccepted, isFalse);
    expect(tester.takeException(), isNull);
  });
}
