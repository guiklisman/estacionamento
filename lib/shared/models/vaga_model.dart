import 'veiculo_model.dart';

class VagaModel {
  String? nomeVaga;
  bool? ocupada;
  VeiculoModel? veiculo;
  DateTime? horaEntrada;
  DateTime? horaSaida;
  double? valorTotal;

  VagaModel({
    this.nomeVaga,
    this.ocupada,
    this.veiculo,
    this.horaEntrada,
    this.horaSaida,
    this.valorTotal,
  });

  @override
  String toString() {
    return 'VagaModel(nomeVaga: $nomeVaga, ocupada: $ocupada, placaVeiculo: $veiculo,'
        'horaEntrada: $horaEntrada, horaSaida: $horaSaida, valorTotal: $valorTotal)';
  }

  factory VagaModel.fromJson(Map<String, dynamic> json) => VagaModel(
        nomeVaga: json['nomeVaga'] as String?,
        ocupada: json['ocupada'] as bool?,
        veiculo: json['veiculo'] as VeiculoModel?,
        horaEntrada: json['horaEntrada'] != null
            ? DateTime.parse(json['horaEntrada'] as String)
            : null,
        horaSaida: json['horaSaida'] != null
            ? DateTime.parse(json['horaSaida'] as String)
            : null,
        valorTotal: json['valorTotal'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'nomeVaga': nomeVaga,
        'ocupada': ocupada,
        'veiculo': veiculo?.toJson(),
        'horaEntrada': horaEntrada?.toIso8601String(),
        'horaSaida': horaSaida?.toIso8601String(),
        'valorTotal': valorTotal,
      };

  VagaModel copyWith({
    String? nomeVaga,
    bool? ocupada,
    VeiculoModel? veiculo,
    DateTime? horaEntrada,
    DateTime? horaSaida,
    double? valorTotal,
  }) {
    return VagaModel(
      nomeVaga: nomeVaga ?? this.nomeVaga,
      ocupada: ocupada ?? this.ocupada,
      veiculo: veiculo ?? this.veiculo,
      horaEntrada: horaEntrada ?? this.horaEntrada,
      horaSaida: horaSaida ?? this.horaSaida,
      valorTotal: valorTotal ?? this.valorTotal,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VagaModel) return false;
    return other.toJson().toString() == toJson().toString();
  }

  @override
  int get hashCode =>
      nomeVaga.hashCode ^
      ocupada.hashCode ^
      veiculo.hashCode ^
      horaEntrada.hashCode ^
      horaSaida.hashCode ^
      valorTotal.hashCode;
}
