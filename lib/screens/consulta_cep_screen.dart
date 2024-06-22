import 'package:flutter/material.dart';
import 'package:my_cep_pk/my_cep_pk.dart';

class ConsultaCepScreen extends StatefulWidget {
  @override
  _ConsultaCepScreenState createState() => _ConsultaCepScreenState();
}

class _ConsultaCepScreenState extends State<ConsultaCepScreen> {
  final TextEditingController _cepController = TextEditingController();
  String _resultado = '';
  String _ultimaPesquisa = '';

  @override
  void initState() {
    super.initState();
    carregarResultadoSalvo();
  }

  void carregarResultadoSalvo() async {
    String? resultado = await CepService.carregarResultadoSalvo();
    setState(() {
      _ultimaPesquisa = resultado ?? '';
    });
  }

  void _pesquisarCep() async {
    String cep = _cepController.text;
    if (cep.isNotEmpty) {
      String resultado = await CepService.pesquisarCep(cep);
      setState(() {
        _resultado = resultado;
        _ultimaPesquisa = resultado;
      });
    } else {
      setState(() {
        _resultado = 'Por favor, digite um CEP.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulte seu Endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite seu CEP',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pesquisarCep,
              child: Text('Pesquisar'),
            ),
            SizedBox(height: 16),
            Text(
              'Sua última pesquisa foi:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(_ultimaPesquisa),
            SizedBox(height: 16),
            Text(
              'Resultado:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
