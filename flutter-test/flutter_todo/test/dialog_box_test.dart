import 'package:flutter_todo/widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/screen/home_page.dart';

void main() {
  testWidgets('test the dialog', (tester) async {
    void saveNewTask(String input) {
      print('1');
    }

    await tester.pumpWidget(MaterialApp(home: DialogBox(onSave: saveNewTask)));
    expect(find.byKey(const Key('btnAdd')), findsOneWidget);
    expect(find.byKey(const Key('TFFnote')), findsOneWidget);
  });
}
