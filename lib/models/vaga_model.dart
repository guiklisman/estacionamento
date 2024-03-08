import 'package:collection/collection.dart';

import 'veiculo_model.dart';

class VagaModel {
  String? nomeVaga;
  bool? ocupada;
  VeiculoModel? veiculo;

  VagaModel({this.nomeVaga, this.ocupada, this.veiculo});

  @override
  String toString() {
    return 'VagaModel(nomeVaga: $nomeVaga, ocupada: $ocupada, placaVeiculo: $veiculo)';
  }

  factory VagaModel.fromJson(Map<String, dynamic> json) => VagaModel(
        nomeVaga: json['nomeVaga'] as String?,
        ocupada: json['ocupada'] as bool?,
        veiculo: json['veiculo'] as VeiculoModel?,
      );

  Map<String, dynamic> toJson() => {
        'nomeVaga': nomeVaga,
        'ocupada': ocupada,
        'placaVeiculo': veiculo,
      };

  VagaModel copyWith({
    String? nomeVaga,
    bool? ocupada,
    String? placaVeiculo,
  }) {
    return VagaModel(
      nomeVaga: nomeVaga ?? this.nomeVaga,
      ocupada: ocupada ?? this.ocupada,
      veiculo: veiculo ?? veiculo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VagaModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => nomeVaga.hashCode ^ ocupada.hashCode ^ veiculo.hashCode;
}
