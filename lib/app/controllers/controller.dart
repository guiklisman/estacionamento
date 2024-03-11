import '../../shared/models/dados_model.dart';
import '../../shared/models/historico_diario_model.dart';
import '../../shared/models/vaga_model.dart';
import '../repository/repository.dart';

class Controller {
  final Repository _repository;

  Controller(this._repository);

  List<VagaModel> vagasOcupadas = [];
  List<VagaModel> vagasLivres = [];

  Future<List<VagaModel>> getVeiculos() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return await _repository.getListVeiculo();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VagaModel>> getHistorico() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return await _repository.getHistorico();
    } catch (e) {
      rethrow;
    }
  }

  Future<HistoricoDiarioModel> getDadosDiario() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return await _repository.getDiario();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> entrarVeiculo(String nomeVaga, String placaVeiculo) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      await _repository.entrarVeiculo(nomeVaga, placaVeiculo);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sairVeiculo(String nomeVaga, double valorTotal) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      await _repository.sairVeiculo(nomeVaga, valorTotal);
    } catch (e) {
      rethrow;
    }
  }

  Future<DadosModel> getDados() async {
    try {
      List<dynamic> results = [];

      results = await Future.wait([
        getDadosDiario(),
        getVeiculos(),
      ]);
      separarVagas(results[1]);

      DadosModel dados = DadosModel(
        historicoDiario: results[0] as HistoricoDiarioModel,
        vagas: results[1] as List<VagaModel>,
        vagasDisponiveis: vagasLivres,
        vagasOcupadas: vagasOcupadas,
      );

      return dados;
    } catch (e) {
      rethrow;
    }
  }

  void separarVagas(List<VagaModel> listaVagas) {
    vagasOcupadas.clear();
    vagasLivres.clear();
    for (var vaga in listaVagas) {
      if (vaga.ocupada!) {
        vagasOcupadas.add(vaga);
      } else {
        vagasLivres.add(vaga);
      }
    }
  }
}
