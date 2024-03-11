import 'package:flutter/material.dart';

import '../../shared/models/dados_model.dart';
import '../../shared/widgets/daily_earnings_card_widget.dart';
import '../../shared/widgets/default_button_widget.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/parking_available_widget.dart';
import '../../shared/widgets/parking_icon_widget.dart';
import '../../shared/widgets/space_widget.dart';
import '../controllers/controller.dart';
import 'entrar_veiculo_page.dart';
import 'historico_dia_page.dart';
import 'sair_veiculo_page.dart';

class HomePage extends StatefulWidget {
  final Controller controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de estacionamento'),
      ),
      body: FutureBuilder(
          future: widget.controller.getDados(),
          builder: (context, response) {
            if (response.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            }
            if (response.hasError) {
              return ErrorWidget(response.error.toString());
            } else {
              DadosModel dados = response.data!;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DailyEarningsCardWidget(
                      totalGainToday:
                          dados.historicoDiario!.totalGanhoHojeReais(),
                      totalCustomersToday:
                          dados.historicoDiario!.totalClientesHoje!,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoricoDiaPage(controller: widget.controller),
                        ),
                      ),
                    ),
                    const SpaceWidget(
                      height: 25,
                    ),
                    const Text(
                      'Minhas Vagas:',
                      style: TextStyle(fontSize: 22),
                    ),
                    const SpaceWidget(
                      height: 25,
                    ),
                    SizedBox(
                      height: 250,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: dados.vagas!.length,
                        itemBuilder: (context, index) {
                          return ParkingIconWidget(
                            vagaPreenchida: dados.vagas![index].ocupada!,
                            nomeVaga: dados.vagas![index].nomeVaga!,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ParkingAvailableWidget(
                          title: 'Vagas Disponíveis: ',
                          value: dados.vagasDisponiveis!.length.toString(),
                        ),
                        ParkingAvailableWidget(
                          title: 'Vagas Ocupadas: ',
                          value: dados.vagasOcupadas!.length.toString(),
                        ),
                      ],
                    ),
                    const SpaceWidget(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DefaultButtonWidget(
                            title: 'Entrar Veículo',
                            icon: Icons.add,
                            colorBackground:
                                const Color.fromARGB(255, 98, 226, 130),
                            vagas: dados.vagasDisponiveis!,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EntrarVeiculoPage(
                                  vagas: dados.vagasDisponiveis!,
                                  controller: widget.controller,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SpaceWidget(
                          width: 15,
                        ),
                        if (dados.vagasOcupadas!.isNotEmpty) ...[
                          Expanded(
                            child: DefaultButtonWidget(
                              title: 'Sair Veículo',
                              icon: Icons.highlight_remove,
                              colorBackground:
                                  const Color.fromARGB(255, 226, 98, 98),
                              vagas: dados.vagasOcupadas!,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SairVeiculoPage(
                                    vagas: dados.vagasOcupadas!,
                                    controller: widget.controller,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
