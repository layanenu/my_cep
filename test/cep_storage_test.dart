import 'package:flutter_test/flutter_test.dart';
import 'package:my_cep_pk/my_cep_pk.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('cepStorage', () {

    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('salvarResultado salva o endereço corretamente', () async {
      const resultado = 'Endereço: Praça da Sé, Sé, São Paulo, SP';

      await CepStorage.salvarResultado(resultado);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('endereco_salvo'), resultado);
    });

    test('carregarResultadoSalvo carrega o endereço salvo corretamente', () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('endereco_salvo', 'Endereço salvo');

      final resultado = await CepStorage.carregarResultadoSalvo();
      expect(resultado, 'Endereço salvo');
    });
  });
}
