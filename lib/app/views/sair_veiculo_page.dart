import 'package:estacionamento/shared/utils/formatters.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/espaco_widget.dart';
import '../controllers/controller.dart';
import '../models/vaga_model.dart';

class SairVeiculoPage extends StatefulWidget {
  final List<VagaModel> vagas;
  final Controller controller;

  const SairVeiculoPage(
      {Key? key, required this.vagas, required this.controller})
      : super(key: key);

  @override
  State<SairVeiculoPage> createState() => _SairVeiculoPageState();
}

class _SairVeiculoPageState extends State<SairVeiculoPage> {
  TextEditingController placaController = TextEditingController();
  late VagaModel vagaSelecionada;

  @override
  void initState() {
    super.initState();
    vagaSelecionada = widget.vagas.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sair Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha abaixo a vaga para liberar:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton<VagaModel>(
                value: vagaSelecionada,
                items: widget.vagas.map((VagaModel vaga) {
                  return DropdownMenuItem<VagaModel>(
                    value: vaga,
                    child: Text(vaga.nomeVaga ?? ''),
                  );
                }).toList(),
                onChanged: (VagaModel? novoValor) {
                  setState(() {
                    vagaSelecionada = novoValor!;
                  });
                },
              ),
            ),
            Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Placa: ${vagaSelecionada.veiculo!.placaVeiculo!}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Entrou: ${Formatters.formatarDateTime(vagaSelecionada.horaEntrada!)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Saindo: ${Formatters.formatarDateTime(DateTime.now())}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Duração Total: ${widget.controller.calcularTempoNoEstabelecimento(vagaSelecionada.horaEntrada!)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Valor total: ${Formatters.doubleToReaisString(widget.controller.calcularValorTotal(vagaSelecionada.horaEntrada!))}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: EspacoWidget(),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    await widget.controller
                        .postSairVeiculo(
                            vagaSelecionada.nomeVaga!,
                            widget.controller.calcularValorTotal(
                                vagaSelecionada.horaEntrada!))
                        .then((value) => Navigator.of(context).pop());
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
            const EspacoWidget(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
