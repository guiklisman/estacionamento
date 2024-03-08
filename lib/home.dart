import 'package:flutter/material.dart';

import 'shared/widgets/default_button_widget.dart';
import 'shared/widgets/parking_available_widget.dart';
import 'shared/widgets/parking_icon_widget.dart';
import 'shared/widgets/space_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showValues = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.green[300]!,
                    Colors.green[500]!,
                    Colors.green[700]!,
                  ],
                  stops: const [0.2, 0.5, 0.8],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: IconButton(
                      icon: Icon(
                        showValues ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          showValues = !showValues;
                        });
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showValues)
                          const Text(
                            'Ganho hoje: R\$ 520,00',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        if (showValues)
                          const Text(
                            'Clientes hoje: 27',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  return ParkingIconWidget(
                    vagaPreenchida: false,
                    numeroVaga: index,
                  );
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ParkingAvailableWidget(
                  title: 'Vagas Disponíveis: ',
                  value: '5',
                ),
                ParkingAvailableWidget(
                  title: 'Vagas Ocupadas: ',
                  value: '7',
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
                    colorBackground: const Color.fromARGB(255, 76, 135, 175),
                    onTap: () => null,
                  ),
                ),
                const SpaceWidget(
                  width: 15,
                ),
                Expanded(
                  child: DefaultButtonWidget(
                    title: 'Sair Veículo',
                    icon: Icons.highlight_remove,
                    colorBackground: const Color.fromARGB(255, 226, 98, 98),
                    onTap: () => null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
