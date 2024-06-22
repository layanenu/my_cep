import 'package:mockito/mockito.dart';
import 'package:my_cep_pk/my_cep_pk.dart';

class MockCepService extends Mock implements CepService {
  @override
  Future<String?> carregarResultadoSalvo() async {
    return Future.delayed(Duration(milliseconds: 100), () => 'Resultado Salvo');
  }

  @override
  Future<String> pesquisarCep(String cep) async {
    return Future.delayed(Duration(milliseconds: 100), () => 'Endereço Encontrado');
  }
}
