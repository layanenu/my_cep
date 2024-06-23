import 'package:dio/dio.dart';

abstract class CepDataSource {
  Future<String> pesquisarCep(String cep);
}

class CepDataSourceImpl {
  final Dio dio;

  CepDataSourceImpl(this.dio);


  Future<String> pesquisarCep(String cep) async {
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200 && response.data['erro'] == null) {
      final data = response.data;
      return 'Endereço: ${data['logradouro']}, ${data['bairro']}, ${data['localidade']}, ${data['uf']}';
    } else {
      return 'CEP não encontrado.';
    }
  }
}