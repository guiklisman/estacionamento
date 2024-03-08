import 'package:flutter/material.dart';

class DailyEarningsCardWidget extends StatefulWidget {
  final double totalGainToday;
  final int totalCustomersToday;
  const DailyEarningsCardWidget(
      {super.key,
      required this.totalGainToday,
      required this.totalCustomersToday});

  @override
  State<DailyEarningsCardWidget> createState() =>
      _DailyEarningsCardWidgetState();
}

class _DailyEarningsCardWidgetState extends State<DailyEarningsCardWidget> {
  bool showValues = true;

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
                setState(
                  () {
                    showValues = !showValues;
                  },
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showValues)
                  Text(
                    'Ganho hoje: R\$ ${widget.totalGainToday}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                if (showValues)
                  Text(
                    'Clientes hoje: ${widget.totalCustomersToday}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
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
