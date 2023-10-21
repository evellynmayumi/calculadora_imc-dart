import 'package:flutter/material.dart';

class CalculadorImc {
  final int id;
  final double peso;
  final double altura;
  final double imc;
  final DateTime data;

  CalculadorImc({
    required this.id,
    required this.peso,
    required this.altura,
    required this.imc,
    required this.data,
  });
}
