import 'package:calculadora_imc/model/calculadora_imc.dart';

class CalculadoraImcRepository {
  List<CalculadorImc> _list = [];

  Future<void> adicionar(CalculadorImc calculo) async {
    await Future.delayed(Duration(microseconds: 200));
    _list.add(calculo);
  }

  Future<void> remover(String id) async {
    await Future.delayed(Duration(microseconds: 200));
    _list.remove(_list.where((calculo) => calculo.id == id).first);
  }

  Future<List<CalculadorImc>> listar() async {
    await Future.delayed(Duration(microseconds: 200));
    return _list;
  }
}
