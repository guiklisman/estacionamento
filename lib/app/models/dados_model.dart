import 'package:estacionamento/app/models/historico_diario_model.dart';
import 'package:estacionamento/app/models/vaga_model.dart';

class DadosModel {
  HistoricoDiarioModel? historicoDiario;
  List<VagaModel>? vagas;
  List<VagaModel>? vagasDisponiveis;
  List<VagaModel>? vagasOcupadas;

  DadosModel({
    this.historicoDiario,
    this.vagas,
    this.vagasDisponiveis,
    this.vagasOcupadas,
  });

  @override
  String toString() {
    return 'DadosModel(historicoDiario: $historicoDiario, vagas: $vagas)';
  }
}
