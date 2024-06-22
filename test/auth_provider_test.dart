import 'package:flutter_test/flutter_test.dart';
import 'package:my_cep/provider/auth_provider.dart';

void main() {
  group('AuthProvider', () {
    late AuthProvider authProvider;

    setUp(() {
      authProvider = AuthProvider();
    });

    test('SignUp - Usuário cadastrado com sucesso', () async {
      String email = 'test@example.com';
      String password = '123456';

      bool success = await authProvider.signUp(email, password);

      expect(success, true);
      expect(authProvider.message, "Usuário cadastrado com sucesso!");
      expect(authProvider.token, isNotNull);
    });

    test('SignIn - Usuário autenticado com sucesso', () async {
      String email = 'test@example.com';
      String password = '123456';

      bool success = await authProvider.signIn(email, password);

      expect(success, true);
      expect(authProvider.message, isNotNull);
      expect(authProvider.token, isNotNull);
    });

  });
}
