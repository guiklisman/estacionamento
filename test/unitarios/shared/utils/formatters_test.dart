import 'package:estacionamento/shared/utils/formatters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Formatters Tests', () {
    test(
        'formatarDateTime() deve retornar a data e hora formatadas corretamente',
        () {
      final dateTime = DateTime(2022, 3, 10, 15, 30);
      final formattedDateTime = Formatters.formatarDateTime(dateTime);

      expect(formattedDateTime, equals('10-03-2022 15:30'));
    });

    test('formatarDateTime deve retornar "Sem Dado" para DateTime nulo', () {
      final formattedDateTime = Formatters.formatarDateTime(null);

      expect(formattedDateTime, equals('Sem Dado'));
    });

    test('doubleToReaisString() deve formatar o valor em Reais corretamente',
        () {
      const valor = 10.15;
      final formattedValue = Formatters.doubleToReaisString(valor);

      // Removendo qualquer caractere invisível para comparar
      final cleanedExpected = 'R\$10,15'.replaceAll(RegExp(r'\s+'), '');
      final cleanedActual = formattedValue.replaceAll(RegExp(r'\s+'), '');

      expect(cleanedActual, equals(cleanedExpected));
    });
  });
}
