import 'package:flutter/material.dart';

class DailyEarningsCardWidget extends StatefulWidget {
  final String totalGainToday;
  final int totalCustomersToday;
  final void Function() onTap;
  const DailyEarningsCardWidget(
      {super.key,
      required this.totalGainToday,
      required this.totalCustomersToday,
      required this.onTap});

  @override
  State<DailyEarningsCardWidget> createState() =>
      _DailyEarningsCardWidgetState();
}

class _DailyEarningsCardWidgetState extends State<DailyEarningsCardWidget> {
  bool mostraValores = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[300]!,
            Colors.blue[500]!,
            Colors.blue[700]!,
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
                mostraValores ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                setState(
                  () {
                    mostraValores = !mostraValores;
                  },
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ganho hoje: ${mostraValores ? widget.totalGainToday : '******'}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Clientes hoje: ${mostraValores ? widget.totalCustomersToday : '**'}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onTap();
                  },
                  child: const Text(
                    'ver histórico',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
