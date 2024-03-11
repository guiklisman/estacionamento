class Validators {
  static String? Function(String) validarPlacaVeiculo() =>
      (String value) => _validarPlacaVeiculo(value);

  static String? _validarPlacaVeiculo(String value) {
    if (value.isEmpty) {
      return 'Campo não pode ser vazio';
    } else if (value.length < 7) {
      return 'Campo deve ter 7 digitos';
    }
    return null;
  }
}
