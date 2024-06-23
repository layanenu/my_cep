import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_cep/services/pesquisar_cep.dart';
import 'mock.mocks.dart';

void main() {
  final dio = MockDio();
  final cepService = CepDataSourceImpl(dio);

  group('ConsultaCepScreen', () {
    test('should get address model when called', () async {
      const response = '''
      {
        "logradouro": "Rua Teste",
        "bairro": "Bairro Teste",
        "localidade": "Cidade Teste",
        "uf": "UF"
      }''';

      final mockResponse = Response(
        data: jsonDecode(response),
        requestOptions: RequestOptions(path: 'https://viacep.com.br/ws/12345678/json/'),
        statusCode: 200,
      );

      when(dio.get('https://viacep.com.br/ws/12345678/json/'))
          .thenAnswer((_) async => mockResponse);

      final result = await cepService.pesquisarCep('12345678');
      expect(result, 'Endereço: Rua Teste, Bairro Teste, Cidade Teste, UF');
    });
  });
}
