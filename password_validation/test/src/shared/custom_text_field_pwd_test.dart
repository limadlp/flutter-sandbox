import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/shared/custom_text_field.dart';
import 'package:password_validation/src/shared/custom_text_field_pwd.dart';

void main() {
  group("Grupo de teste do TextFormField PWD", () {
    testWidgets('Renderizar corretamente o CustomTextField', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(CustomTextField), findsOneWidget);
    });
  });

  testWidgets('Exibe o label corretamente quando fornecido', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFieldPwd(
            label: 'Label Teste',
            backgroundColor: Colors.white,
            controller: TextEditingController(),
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsOneWidget);
    expect(find.text('Label Teste'), findsOneWidget);
  });

  testWidgets('Verificar se obscureText está configurado corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFieldPwd(
            label: 'Label Teste',
            backgroundColor: Colors.white,
            controller: TextEditingController(),
          ),
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });

  //TODO: -11:10
}
