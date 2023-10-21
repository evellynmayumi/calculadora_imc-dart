import 'package:calculadora_imc/model/calculadora_imc.dart';
import 'package:hive/hive.dart';

class CalculadoraImcRepository {
  static const String tabelaIMC = "imc";

  Future<void> abrirBancoDeDados() async {
    await Hive.openBox<CalculadorImc>(tabelaIMC);
  }

  Future<List<CalculadorImc>> listar() async {
    final db = await Hive.openBox<CalculadorImc>(tabelaIMC);
    return db.values.toList();
  }

  Future<void> adicionar(CalculadorImc imc) async {
    final db = await Hive.openBox<CalculadorImc>(tabelaIMC);
    db.add(imc);
  }

  Future<void> remover(int id) async {
    final db = await Hive.openBox<CalculadorImc>(tabelaIMC);
    db.deleteAt(id);
  }
}