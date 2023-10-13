class NomeException implements Exception {
  String error() => "Nome inválido. Insira apenas letras.";
  @override
  String toString() {
    return "NomeInvalidoException: ${error()}";
  }
}

