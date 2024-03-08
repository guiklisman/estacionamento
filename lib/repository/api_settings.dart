import 'package:dio/dio.dart';

class APISettings {
  final Dio dio;

  APISettings(this.dio);

  Future<List<T>> get<T>(String path) async {
    try {
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        final List<T> data = response.data;
        List<T> list = data.map((json) => T).cast<T>().toList();
        return list;
      } else {
        throw Exception('Erro na solicitação GET');
      }
    } catch (e) {
      throw Exception('Erro de rede: $e');
    }
  }
}
