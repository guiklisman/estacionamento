import 'package:estacionamento/shared/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Data Teste', () {
    test('alterarEntradaVaga() deve alterar horaEntrada corretamente', () {
      final data = Data.instance;
      const nomeVaga = 'A1';
      const novaPlaca = 'ABC-1234';

      data.alterarEntradaVaga(nomeVaga, novaPlaca);

      final vaga = data.vagas.firstWhere((vaga) => vaga.nomeVaga == nomeVaga);
      expect(vaga.ocupada, true);
      expect(vaga.horaEntrada, isNotNull);
    });

    test('alterarSaidaVaga() deve alterar horaSaida e adicionar ao histórico',
        () {
      final data = Data.instance;
      const nomeVaga = 'B4';
      const valorTotal = 20.0;

      data.alterarSaidaVaga(nomeVaga, valorTotal);

      final vaga = data.vagas.firstWhere((vaga) => vaga.nomeVaga == nomeVaga);
      expect(vaga.ocupada, false);
      expect(vaga.horaSaida, isNotNull);
      expect(vaga.valorTotal, valorTotal);

      expect(data.historicoDiario.totalGanhoHoje, valorTotal);
      expect(data.historicoDiario.totalClientesHoje, 1);
      expect(data.historicoDoDia, contains(vaga));
    });
  });
}
