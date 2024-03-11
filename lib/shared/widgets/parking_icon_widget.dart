import 'package:flutter/material.dart';

class ParkingIconWidget extends StatelessWidget {
  final bool vagaPreenchida;
  final String nomeVaga;

  const ParkingIconWidget({
    super.key,
    required this.vagaPreenchida,
    required this.nomeVaga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: vagaPreenchida
            ? const Color.fromARGB(255, 219, 0, 0)
            : const Color.fromARGB(255, 0, 150, 75),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          nomeVaga,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
