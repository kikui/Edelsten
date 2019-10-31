
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edelsten/views/common/common.dart';

import 'package:edelsten/main.dart';

void main() {
  testWidgets('My widget has a title and a description', (WidgetTester tester) async {

    // Widget to test
    await tester.pumpWidget(TitleAndDescription(title: 'T', content: 'D'));
    
    // Search for widget using finder
    final titleFinder = find.text('T');
    final contentFinder = find.text('D');

    // Verify the widget using a Matcher
    expect(titleFinder, findsOneWidget);
    expect(contentFinder, findsOneWidget);
  });
}
