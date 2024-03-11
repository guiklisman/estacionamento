import 'package:estacionamento/app/models/historico_diario_model.dart';
import 'package:estacionamento/app/models/vaga_model.dart';

import '../../shared/api_settings/api_settings.dart';
import '../../shared/data/data.dart';

//CLASSE REPOSITORY FAKE SOMENTE PARA REALIZAR A CONSTRUÇÃO DO TESTE DO APP
//OS DADOS VEM DA CLASSE DADOS
class Repository extends APISettings {
  Repository(super.dio, this.data);
  final Data data;

  Future<List<VagaModel>> getListVagas() async {
    try {
      // final response = await getList('pathFake', VagaModel.fromJson);
      return data.vagas;
      // if (response.statusCode == 200) {
      //   return (response.data as List).map((e) => VagaModel.fromJson(e)).toList();
      // } else {
      //   throw Exception('Falha ao buscar vagas');
      // }
    } catch (error) {
      throw Exception('Falha ao buscar vagas: $error');
    }
  }

  Future<HistoricoDiarioModel> getDiario() async {
    try {
      // final response = await getList('pathFake', VagaModel.fromJson);

      return data.historicoDiario;
      // if (response.statusCode == 200) {
      //   return (response.data as List).map((e) => VagaModel.fromJson(e)).toList();
      // } else {
      //   throw Exception('Falha ao buscar vagas');
      // }
    } catch (error) {
      throw Exception('Falha ao buscar dados diários: $error');
    }
  }

  Future<List<VagaModel>> getHistorico() async {
    try {
      // final response = await getList('pathFake', VagaModel.fromJson);
      return data.getHistorico;
      // if (response.statusCode == 200) {
      //   return (response.data as List).map((e) => VagaModel.fromJson(e)).toList();
      // } else {
      //   throw Exception('Falha ao buscar vagas');
      // }
    } catch (error) {
      throw Exception('Falha ao buscar histórico: $error');
    }
  }

  Future<String> entrarVeiculo(String nomeVaga, String placaVeiculo) async {
    // final response = await postList('pathFake', VagaModel.fromJson);
    try {
      data.alterarEntradaVaga(nomeVaga, placaVeiculo);
      // if (response.statusCode == 200) {
      //   return (response.data as List).map((e) => VagaModel.fromJson(e)).toList();
      // } else {
      //   throw Exception('Falha ao buscar vagas');
      // }
      return 'Veículo adicionado com sucesso !';
    } catch (error) {
      throw Exception('Falha ao entrar com veículo');
    }
  }

  Future<String> sairVeiculo(String nomeVaga, double valorTotal) async {
    try {
      // final response = await postList('pathFake', VagaModel.fromJson);

      data.alterarSaidaVaga(nomeVaga, valorTotal);
      // if (response.statusCode == 200) {
      //   return (response.data as List).map((e) => VagaModel.fromJson(e)).toList();
      // } else {
      //   throw Exception('Falha ao buscar vagas');
      // }
      return 'Veículo removido com sucesso !';
    } catch (error) {
      throw Exception('Falha ao sair com veículo: $error');
    }
  }
}
