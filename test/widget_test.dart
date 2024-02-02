// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipponya_regi/main.dart';

// モックのMethodChannelクラス
class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // モックのMethodChannelを作成
    final mockMethodChannel = MockMethodChannel();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MyApp(methodChannel: mockMethodChannel),
      ),
    );

    // テストのロジックをここに追加
  });
}
