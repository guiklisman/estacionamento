import 'package:estacionamento/shared/models/historico_diario_model.dart';
import 'package:estacionamento/shared/models/vaga_model.dart';

import '../../shared/api_settings/api_settings.dart';
import '../../shared/data/data.dart';

class Repository extends APISettings {
  Repository(super.dio, this.data);
  final Data data;

  Future<List<VagaModel>> getListVeiculo() async {
    // final response = await getList('pathFake', VagaModel.fromJson);
    return data.vagas;
  }

  Future<HistoricoDiarioModel> getDiario() async {
    // final response = await getList('pathFake', VagaModel.fromJson);

    return data.historicoDiario;
  }

  Future<List<VagaModel>> getHistorico() async {
    // final response = await getList('pathFake', VagaModel.fromJson);
    return data.getHistorico;
  }

  Future<String> entrarVeiculo(String nomeVaga, String placaVeiculo) async {
    // final response = await postList('pathFake', VagaModel.fromJson);

    data.alterarEntradaVaga(nomeVaga, placaVeiculo);

    return 'Veículo adicionado com sucesso !';
  }

  Future<String> sairVeiculo(String nomeVaga, double valorTotal) async {
    // final response = await postList('pathFake', VagaModel.fromJson);

    data.alterarSaidaVaga(nomeVaga, valorTotal);

    return 'Veículo adicionado com sucesso !';
  }
}
