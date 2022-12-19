import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todo/screen/home_page.dart';

void main() {
  testWidgets('test the + button', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byKey(const Key('fabplus')), findsOneWidget);
  });
}
