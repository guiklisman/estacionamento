import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class HistoricoDiarioModel {
  double? totalGanhoHoje;
  int? totalClientesHoje;

  HistoricoDiarioModel({this.totalGanhoHoje, this.totalClientesHoje});

  @override
  String toString() {
    return 'HistoricoDiarioModel(totalGanhoHoje: $totalGanhoHoje, totalClientesHoje: $totalClientesHoje)';
  }

  factory HistoricoDiarioModel.fromJson(Map<String, dynamic> json) {
    return HistoricoDiarioModel(
      totalGanhoHoje: json['totalGanhoHoje'] as double?,
      totalClientesHoje: json['totalClientesHoje'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'totalGanhoHoje': totalGanhoHoje,
        'totalClientesHoje': totalClientesHoje,
      };

  HistoricoDiarioModel copyWith({
    double? totalGanhoHoje,
    int? totalClientesHoje,
  }) {
    return HistoricoDiarioModel(
      totalGanhoHoje: totalGanhoHoje ?? this.totalGanhoHoje,
      totalClientesHoje: totalClientesHoje ?? this.totalClientesHoje,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HistoricoDiarioModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => totalGanhoHoje.hashCode ^ totalClientesHoje.hashCode;

  String totalGanhoHojeReais() {
    if (totalGanhoHoje != null) {
      final formattedValue =
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
              .format(totalGanhoHoje!);
      return formattedValue;
    }
    return 'Sem Dado';
  }
}
