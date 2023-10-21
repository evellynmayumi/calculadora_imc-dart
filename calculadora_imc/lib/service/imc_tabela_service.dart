class ImcTabelaService {
  static double medidorImc(double peso, double altura) {
    return peso / (altura * altura);
  }

  static String calcularImc(double imc) {
    switch (imc.floor()) {
      case 16:
      case 17:
        return "Magreza grave";
      case 18:
      case 19:
        return "Magreza moderada";
      case 20:
      case 21:
        return "Magreza leve";
      case 22:
      case 23:
      case 24:
        return "Normal";
      case 25:
      case 26:
        return "Sobrepeso";
      case 27:
      case 28:
      case 29:
        return "Obesidade grau I";
      case 30:
      case 31:
      case 32:
      case 33:
        return "Obesidade grau II";
      case 34:
      case 35:
      case 36:
      case 37:
        return "Obesidade grau III";
      default:
        return "Obesidade grau IV";
    }
  }

  static double CalculadorImc(double peso, double altura) {
    return medidorImc(peso, altura);
  }
}
