import 'package:estacionamento/models/veiculo_model.dart';
import 'package:estacionamento/repository/api_settings.dart';

class Repository extends APISettings {
  Repository(super.dio);

  Future<List<VeiculoModel>> getListVeiculo() async {
    final response = await get('www.hotmail.com/teste');
    return response;
  }
}
