import 'package:dio/dio.dart';
import 'package:estacionamento/app/repository/repository.dart';
import 'package:estacionamento/shared/data/data.dart';
import 'package:estacionamento/shared/models/historico_diario_model.dart';
import 'package:estacionamento/shared/models/vaga_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Repository Tests', () {
    late Dio dio;
    late Data data;
    late Repository repository;

    setUp(() {
      dio = Dio();
      data = Data();
      repository = Repository(dio, data);
    });

    test('getListVeiculo() deve retornar lista de veículos', () async {
      final result = await repository.getListVeiculo();

      expect(result, isA<List<VagaModel>>());
    });

    test('getDiario() deve retornar histórico diário', () async {
      final result = await repository.getDiario();

      expect(result, isA<HistoricoDiarioModel>());
    });

    test('getHistorico() deve retornar histórico', () async {
      final result = await repository.getHistorico();

      expect(result, isA<List<VagaModel>>());
    });

    test('entrarVeiculo() deve alterar entrada do veículo', () async {
      const nomeVaga = 'A1';
      const placaVeiculo = 'ABC1234';

      final result = await repository.entrarVeiculo(nomeVaga, placaVeiculo);

      expect(result, equals('Veículo adicionado com sucesso !'));
      expect(data.getVagas[0].ocupada, isTrue);
      expect(data.getVagas[0].veiculo!.placaVeiculo, equals(placaVeiculo));
      expect(data.getVagas[0].horaEntrada, isNotNull);
    });

    test('sairVeiculo() deve alterar saída do veículo', () async {
      const nomeVaga = 'A1';
      const valorTotal = 20.0;

      final result = await repository.sairVeiculo(nomeVaga, valorTotal);

      expect(result, equals('Veículo adicionado com sucesso !'));
      expect(data.getVagas[0].ocupada, isFalse);
      expect(data.getVagas[0].horaSaida, isNotNull);
      expect(data.getHistoricoDiario.totalGanhoHoje, equals(valorTotal));
      expect(data.getHistoricoDiario.totalClientesHoje, equals(1));
    });
  });
}
