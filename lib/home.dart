import 'package:flutter/material.dart';

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
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(10.0),
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
                            ),
                          ),
                        if (showValues)
                          const Text(
                            'Clientes hoje: 27',
                            style: TextStyle(
                              fontSize: 25,
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
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Define o número de colunas
                  crossAxisSpacing:
                      8.0, // Espaçamento horizontal entre os itens
                  mainAxisSpacing: 8.0, // Espaçamento vertical entre os itens
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Vaga $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Cor da borda cinza
                      width: 1.0, // Largura da borda
                    ),
                    borderRadius: BorderRadius.circular(
                        10.0), // Ajuste o raio conforme necessário
                  ),
                  child: const Center(
                    child: Text(
                      'Vagas Disponíveis: 3',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Cor da borda cinza
                      width: 1.0, // Largura da borda
                    ),
                    borderRadius: BorderRadius.circular(
                        10.0), // Ajuste o raio conforme necessário
                  ),
                  child: const Center(
                    child: Text(
                      'Vagas Ocupadas: 13',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => (),
                    icon: const Icon(Icons.add),
                    label: const Text('Entrar Veículo'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(
                          255,
                          76,
                          135,
                          175,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => (),
                    icon: const Icon(Icons.add),
                    label: const Text('Sair Veículo'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 226, 98, 98),
                      ),
                    ),
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
