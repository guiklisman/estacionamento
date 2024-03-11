import 'package:flutter/material.dart';

import '../../shared/widgets/botao_padrao_widget.dart';
import '../../shared/widgets/card_ganhos_totais_widget.dart';
import '../../shared/widgets/carregando_widget.dart';
import '../../shared/widgets/espaco_widget.dart';
import '../../shared/widgets/vaga_disponivel_widget.dart';
import '../../shared/widgets/vaga_icone_widget.dart';
import '../controllers/controller.dart';
import '../models/dados_model.dart';
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
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaTela = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gerenciador de estacionamento',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
              future: widget.controller.getDados(),
              builder: (context, response) {
                if (response.connectionState == ConnectionState.waiting) {
                  return const CarregandoWidget();
                }
                if (response.hasError) {
                  return ErrorWidget(response.error.toString());
                } else {
                  DadosModel dados = response.data!;

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CardGanhosTotaisWidget(
                          largura: larguraTela * 0.8,
                          altura: alturaTela * 0.25,
                          tamanhoFonte: larguraTela * 0.07,
                          totalGanhoHoje:
                              dados.historicoDiario!.totalGanhoHojeReais(),
                          totalClientesHoje:
                              dados.historicoDiario!.totalClientesHoje!,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoricoDiaPage(
                                  controller: widget.controller),
                            ),
                          ),
                        ),
                        const EspacoWidget(
                          height: 25,
                        ),
                        Text(
                          'Minhas Vagas:',
                          style: TextStyle(
                            fontSize: larguraTela * 0.06,
                          ),
                        ),
                        const EspacoWidget(
                          height: 25,
                        ),
                        SizedBox(
                          height: alturaTela * 0.2,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: dados.vagas!.length,
                            itemBuilder: (context, index) {
                              return VagaIconeWidget(
                                vagaPreenchida: dados.vagas![index].ocupada!,
                                nomeVaga: dados.vagas![index].nomeVaga!,
                                largura: larguraTela * 0.05,
                                altura: alturaTela * 0.03,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            VagaDisponivelWidget(
                              height: alturaTela * 0.05,
                              width: larguraTela * 0.4,
                              sizeTitle: larguraTela * 0.03,
                              title: 'Vagas Disponíveis: ',
                              value: dados.vagasDisponiveis!.length.toString(),
                            ),
                            VagaDisponivelWidget(
                              height: alturaTela * 0.05,
                              width: larguraTela * 0.4,
                              sizeTitle: larguraTela * 0.03,
                              title: 'Vagas Ocupadas: ',
                              value: dados.vagasOcupadas!.length.toString(),
                            ),
                          ],
                        ),
                        EspacoWidget(
                          height: alturaTela * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BotaoPadraoWidget(
                                altura: alturaTela * 0.07,
                                largura: larguraTela * 0.25,
                                titulo: 'Entrar Veículo',
                                icone: Icons.add,
                                corDeFundo:
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
                            const EspacoWidget(
                              width: 15,
                            ),
                            if (dados.vagasOcupadas!.isNotEmpty) ...[
                              Expanded(
                                child: BotaoPadraoWidget(
                                  altura: alturaTela * 0.07,
                                  largura: larguraTela * 0.25,
                                  titulo: 'Sair Veículo',
                                  icone: Icons.highlight_remove,
                                  corDeFundo:
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
                                  ).then((value) => setState(() {})),
                                ),
                              )
                            ]
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
