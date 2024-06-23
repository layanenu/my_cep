import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_cep/screens/consulta_cep_screen.dart';

void main() {
  group('ConsultaCepScreen Widget Test', () {

    testWidgets('Widget Construction', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ConsultaCepScreen()));

      expect(find.text('Consulte seu Endereço'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Pesquisar'), findsOneWidget);
      expect(find.text('Sua última pesquisa foi:'), findsOneWidget);
      expect(find.text('Resultado:'), findsOneWidget);
    });
  });
}
