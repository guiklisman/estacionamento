import 'package:flutter/material.dart';

import '../../shared/models/vaga_model.dart';
import '../../shared/utils/validators.dart';
import '../controllers/controller.dart';

class EntrarVeiculoPage extends StatefulWidget {
  final List<VagaModel> vagas;
  final Controller controller;

  const EntrarVeiculoPage(
      {Key? key, required this.vagas, required this.controller})
      : super(key: key);

  @override
  State<EntrarVeiculoPage> createState() => _EntrarVeiculoPageState();
}

class _EntrarVeiculoPageState extends State<EntrarVeiculoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        title: const Text('Entrar Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha abaixo a vaga para entrar com veículo:',
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
            Form(
              key: _formKey,
              child: TextFormField(
                controller: placaController,
                decoration: const InputDecoration(
                  labelText: 'Digite a placa do veículo',
                ),
                keyboardType: TextInputType.text,
                maxLength: 7,
                validator: (value) {
                  return Validators.validarPlacaVeiculo()(value!);
                },
              ),
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
                    if (_formKey.currentState!.validate()) {
                      await widget.controller.entrarVeiculo(
                          vagaSelecionada.nomeVaga!, placaController.text);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
