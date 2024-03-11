import 'package:dio/dio.dart';

class APISettings {
  final Dio dio;

  APISettings(this.dio);

  Future<List<T>> getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        final List<dynamic> jsonDataList = response.data;

        List<T> list = [];

        for (var jsonData in jsonDataList) {
          T item = fromJson(jsonData);
          list.add(item);
        }

        return list;
      } else {
        throw Exception('Erro na solicitação GET');
      }
    } catch (e) {
      throw Exception('Erro de rede: $e');
    }
  }

  Future<T> get<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw Exception('Erro na solicitação GET');
      }
    } catch (e) {
      throw Exception('Erro de rede: $e');
    }
  }
}
