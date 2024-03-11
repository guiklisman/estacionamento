import '../../app/models/historico_diario_model.dart';
import '../../app/models/vaga_model.dart';
import '../../app/models/veiculo_model.dart';

class Data {
  static final Data _data = Data();

  static Data get instance => _data;

  HistoricoDiarioModel get getHistoricoDiario => historicoDiario;
  List<VagaModel> get getVagas => List<VagaModel>.from(vagas);
  List<VagaModel> get getHistorico => List<VagaModel>.from(historicoDoDia);

  HistoricoDiarioModel historicoDiario = HistoricoDiarioModel(
    totalGanhoHoje: 0,
    totalClientesHoje: 0,
  );
  void alterarEntradaVaga(String nomeVaga, String novaPlaca) {
    for (var vaga in vagas) {
      if (vaga.nomeVaga == nomeVaga) {
        vaga.veiculo?.placaVeiculo = novaPlaca;
        vaga.ocupada = true;
        vaga.horaEntrada = DateTime.now();
        break;
      }
    }
  }

  void alterarSaidaVaga(String nomeVaga, double valorTotal) {
    for (var vaga in vagas) {
      if (vaga.nomeVaga == nomeVaga) {
        vaga.ocupada = false;
        vaga.horaSaida = DateTime.now();
        vaga.valorTotal = valorTotal;
        historicoDiario.totalGanhoHoje =
            (historicoDiario.totalGanhoHoje ?? 0) + valorTotal;
        historicoDiario.totalClientesHoje =
            (historicoDiario.totalClientesHoje ?? 0) + 1;
        historicoDoDia.add(vaga);
        break;
      }
    }
  }

  List<VagaModel> vagas = [
    VagaModel(
      nomeVaga: 'A1',
      ocupada: false,
      horaEntrada: null,
      horaSaida: null,
      veiculo: VeiculoModel(
        placaVeiculo: null,
      ),
    ),
    VagaModel(
      nomeVaga: 'B4',
      ocupada: false,
      horaEntrada: null,
      horaSaida: null,
      veiculo: VeiculoModel(
        placaVeiculo: null,
      ),
    ),
    VagaModel(
      nomeVaga: 'B2',
      ocupada: false,
      horaEntrada: null,
      horaSaida: null,
      veiculo: VeiculoModel(
        placaVeiculo: null,
      ),
    ),
  ];

  List<VagaModel> historicoDoDia = [];
}
