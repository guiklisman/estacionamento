import 'package:collection/collection.dart';

class VeiculoModel {
  String? placaVeiculo;

  VeiculoModel({this.placaVeiculo});

  @override
  String toString() => 'VeiculoModel(placaVeiculo: $placaVeiculo)';

  factory VeiculoModel.fromJson(Map<String, dynamic> json) => VeiculoModel(
        placaVeiculo: json['placaVeiculo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'placaVeiculo': placaVeiculo,
      };

  VeiculoModel copyWith({
    String? placaVeiculo,
  }) {
    return VeiculoModel(
      placaVeiculo: placaVeiculo ?? this.placaVeiculo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VeiculoModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => placaVeiculo.hashCode;
}
