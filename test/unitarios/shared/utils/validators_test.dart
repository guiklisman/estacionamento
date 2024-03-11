import 'package:estacionamento/shared/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators Tests', () {
    test('validarPlacaVeiculo() deve retornar nulo para placa válida', () {
      final validator = Validators.validarPlacaVeiculo();
      final resultado = validator('ABC1234');

      expect(resultado, isNull);
    });

    test(
        'validarPlacaVeiculo() deve retornar mensagem de erro para placa vazia',
        () {
      final validator = Validators.validarPlacaVeiculo();
      final resultado = validator('');

      expect(resultado, equals('Campo não pode ser vazio'));
    });

    test(
        'validarPlacaVeiculo() deve retornar mensagem de erro para placa com menos de 7 dígitos',
        () {
      final validator = Validators.validarPlacaVeiculo();
      final resultado = validator('ABC123');

      expect(resultado, equals('Campo deve ter 7 digitos'));
    });
  });
}
