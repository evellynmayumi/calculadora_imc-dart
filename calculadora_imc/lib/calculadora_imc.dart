import 'dart:io';

import 'package:calculadora_imc/classe/console_utils.dart';
import 'package:calculadora_imc/classe/pessoa.dart';
import 'package:calculadora_imc/exception/nome_exception.dart';
import 'package:calculadora_imc/exception/peso_exception.dart';


String medidorImc(double imc) {
  if (imc <= 16) {
    return "Magreza grave";
  } else if (imc > 16 && imc < 17) {
    return "Magreza moderada";
  } else if (imc > 17 && imc < 18.5) {
    return "Magreza leve";
  } else if (imc > 18.5 && imc < 25) {
    return "Saudável";
  }
  if (imc > 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc > 30 && imc < 35) {
    return "Obesidade Grau I";
  } else if (imc > 35 && imc < 40) {
    return "Obesidade Garu II (severa)";
  } else {
    return "Obesidade Garu III (móbida)";
  }
}

void main() {
  // Ler os dados do terminal
  String nome = ConsoleUtils.lerStringComTexto("Digite seu nome: ");
  double peso = stdin.readLineSync() as double;
  double altura = stdin.readLineSync() as double;

  // Criar uma instancia da classe pessoa
  Pessoa pessoa = Pessoa(nome, peso, altura);

  // Calcular o IMC
  double imc = pessoa.calcularIMC();

  // Imprimir o resultado do cálculo na tela
  print("O IMC da pessoa é $imc.");

  // Imprimir a classificação do IMC
  print("A classificação do IMC é ${medidorImc(imc)}.");

}
