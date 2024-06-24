import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_cep/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de Integração: Cadastro, Login e Consulta de CEP', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text('Acessar'), findsOneWidget);

    await tester.tap(find.text('Ainda não tenho cadastro'));
    await tester.pumpAndSettle();

    expect(find.text('Tela de cadastro'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), '123456');
    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle();

    expect(find.text('Consulte seu Endereço'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '01311000');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();

    expect(find.text('Endereço: Praça da Sé, Sé, São Paulo, SP'), findsOneWidget);
  });
}
