import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration-test', () {
    testWidgets('home-screen', (WidgetTester tester) async {
      await setUp(tester);
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('insert-todo', (WidgetTester tester) async {
      await setUp(tester);
      var addBtn = find.byKey(const Key('add_btn'));
      await tester.tap(addBtn);
      await tester.pumpAndSettle();

      await fillForm(tester, 'abcd', '1234');
    });

    testWidgets('insert-title-require', (WidgetTester tester) async {
      await setUp(tester);
      var addBtn = find.byKey(const Key('add_btn'));
      await tester.tap(addBtn);
      await tester.pumpAndSettle();


      final description = find.byKey(const Key('description'));
      await tester.enterText(description, 'aaa');
      expect(find.text('aaa'), findsOneWidget);

      var saveBtn = find.byKey(const Key('save_btn'));
      await tester.tap(saveBtn);
      await tester.pumpAndSettle();

      expect(find.text('Please fill title'), findsOneWidget);
    });

    testWidgets('update-todo', (WidgetTester tester) async {
      await setUp(tester);
      var addBtn = find.byKey(const Key('0'));
      await tester.tap(addBtn);
      await tester.pumpAndSettle();
      await fillForm(tester, 'test-update-title', 'test-update-description');
    });
  });
}

Future<void> fillForm(
    WidgetTester tester, String titleValue, String descriptionValue) async {
  final title = find.byKey(const Key('title'));
  await tester.enterText(title, titleValue);
  expect(find.text(titleValue), findsOneWidget);

  final description = find.byKey(const Key('description'));
  await tester.enterText(description, descriptionValue);
  expect(find.text(descriptionValue), findsOneWidget);

  var saveBtn = find.byKey(const Key('save_btn'));
  await tester.tap(saveBtn);
  await tester.pumpAndSettle();

  expect(find.text(titleValue), findsOneWidget);
  expect(find.text(descriptionValue), findsOneWidget);
}

Future<void> setUp(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 20));
  await tester.pumpAndSettle();
}
