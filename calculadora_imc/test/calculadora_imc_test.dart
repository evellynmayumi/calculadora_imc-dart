// ignore_for_file: unused_import
import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/classe/pessoa.dart';
import 'package:calculadora_imc/exception/nome_exception.dart';
import 'package:calculadora_imc/exception/peso_exception.dart';
import 'package:test/test.dart';

void main() {
  void main() {
    group("Pessoa", () {
      test("Deve calcular o IMC corretamente", () {
        Pessoa pessoa = Pessoa("João", 80.0, 1.80);

        expect(pessoa.calcularIMC(), equals(25.0));
      });

      test("Deve lançar uma exceção se o peso for negativo", () {
        expect(() => Pessoa("Maria", -1.0, 1.80), throwsException);
      });

      // test("Deve lançar uma exceção se a altura for negativa", () {
      //   expect(() => Pessoa("Paulo", 80.0, -1.0), throwsException);
      // });
    });
  }
}


