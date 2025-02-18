import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tests_sandbox/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de incremento e decremento', (WidgetTester tester) async {
    // Inicia o app
    await tester.pumpWidget(MyApp());

    // Verifica o estado inicial
    expect(
      find.text('Count: 0'),
      findsOneWidget,
      reason: 'O contador deveria iniciar com 0',
    );

    // Incrementa o contador
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(
      find.text('Count: 1'),
      findsOneWidget,
      reason: 'O contador deveria incrementar para 1 após toque em "+"',
    );

    // Decrementa o contador
    await tester.tap(find.text('-'));
    await tester.pump();
    expect(
      find.text('Count: 0'),
      findsOneWidget,
      reason: 'O contador deveria voltar para 0 após toque em "-"',
    );
  });
}
