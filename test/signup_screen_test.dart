import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_cep/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_cep/provider/auth_provider.dart';
import 'package:my_cep/routes/app_routes.dart';

void main() {
  Widget createTestWidget({required Widget child}) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        home: child,
        routes: {
          AppRoutes.consultaCep: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Consulte seu Endereço'),
            ),
          ),
        },
      ),
    );
  }

  testWidgets('Renderização da SignUpScreen', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(child: SignUpScreen()));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Tela de cadastro'), findsOneWidget);
    expect(find.byKey(Key('emailField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });


  testWidgets('Entrada de texto nos campos de email e senha', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(child: SignUpScreen()));

    final emailField = find.widgetWithText(TextField, 'Email');
    final passwordField = find.widgetWithText(TextField, 'Senha');

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, '123456');

    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
  });
}