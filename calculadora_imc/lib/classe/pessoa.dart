import 'dart:convert';
import 'dart:io';
import 'console_utils.dart';

import 'package:calculadora_imc/calculadora_imc.dart';

class Pessoa {
  final String _nome;
  final double _peso;
  final double _altura;

  Pessoa(this._nome, this._peso, this._altura);

  double calcularIMC() {
    return _peso / (_altura * _altura);
  }
}

