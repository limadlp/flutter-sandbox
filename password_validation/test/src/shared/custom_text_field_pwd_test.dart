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

  testWidgets('Verificar se o suffixIcon está renderizando corretamente', (
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

    TextField getTextField() {
      return tester.widget<TextField>(find.byType(TextField));
    }

    expect(getTextField().obscureText, isTrue);

    await tester.tap(find.byIcon(Icons.visibility_outlined));
    await tester.pump();

    expect(getTextField().obscureText, isFalse);
    expect(
      find.byIcon(Icons.visibility_off_outlined),
      findsOneWidget,
      reason: 'Deve apresentar o ícone Icons.visibility_off_outlined',
    );
    expect(find.byIcon(Icons.visibility_outlined), findsNothing);

    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();

    expect(getTextField().obscureText, isTrue);
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off_outlined), findsNothing);
  });

  testWidgets('Verificar se controller está sendo preenchida corretamente', (
    WidgetTester tester,
  ) async {
    var controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFieldPwd(
            label: 'Label Teste',
            backgroundColor: Colors.white,
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'senha1234');
    await tester.pump();
    expect(controller.text, 'senha1234');
  });
}
