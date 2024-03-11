import 'package:estacionamento/app/models/vaga_model.dart';
import 'package:estacionamento/shared/utils/formatters.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/carregando_widget.dart';
import '../controllers/controller.dart';

class HistoricoDiaPage extends StatefulWidget {
  final Controller controller;
  const HistoricoDiaPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HistoricoDiaPage> createState() => _HistoricoDiaPageState();
}

class _HistoricoDiaPageState extends State<HistoricoDiaPage> {
  List<VagaModel> historico = [];
  @override
  void initState() {
    super.initState();
    widget.controller.getHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico do Dia'),
      ),
      body: FutureBuilder(
        future: widget.controller.getHistorico(),
        builder: (context, response) {
          if (response.connectionState == ConnectionState.waiting) {
            return const CarregandoWidget();
          }

          if (response.hasError) {
            return ErrorWidget(response.error.toString());
          }
          historico.addAll(response.data!);
          if (historico.isEmpty) {
            {
              return const Center(
                  child: Text(
                'Ainda não ocorreu nenhuma movimentação hoje!',
              ));
            }
          } else {
            return ListView.builder(
              itemCount: historico.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vaga: ${historico[index].nomeVaga!}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Placa: ${historico[index].veiculo!.placaVeiculo}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Entrou: ${Formatters.formatarDateTime(historico[index].horaEntrada!)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Saiu: R\$${Formatters.formatarDateTime(historico[index].horaSaida!)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Valor: ${Formatters.doubleToReaisString(historico[index].valorTotal!)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
