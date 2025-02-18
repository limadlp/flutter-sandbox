// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_sandbox/main.dart';
import 'package:tests_sandbox/views/text_overflow_example.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Count: 0'), findsOneWidget);

    // Verify that our counter starts at 0.
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    for (var i = 0; i < 10; i++) {
      await tester.tap(find.text('+'));
      await tester.pump();
    }

    expect(find.text('Count: 10'), findsOneWidget);
  });

  testWidgets('Verifica se ocorre overflow de texto em telas pequenas', (
    WidgetTester tester,
  ) async {
    // Inicializa o widget
    await tester.pumpWidget(MaterialApp(home: TextOverflowExample()));

    // Define o tamanho da tela como pequeno
    await tester.binding.setSurfaceSize(const Size(300, 600));
    await tester.pump();

    // Verifica que o texto ainda é encontrado (mas truncado)
    expect(find.textContaining('Esse é um texto muito longo'), findsOneWidget);

    // Define o tamanho da tela como grande
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    await tester.pump();

    // Verifica que o texto completo está presente
    expect(
      find.textContaining('Vamos verificar se ele quebra ou dá erro.'),
      findsOneWidget,
    );
  });
}
