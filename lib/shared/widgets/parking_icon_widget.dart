import 'package:flutter/material.dart';

class ParkingIconWidget extends StatelessWidget {
  final bool vagaPreenchida;
  final int numeroVaga;

  const ParkingIconWidget({
    super.key,
    required this.vagaPreenchida,
    required this.numeroVaga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            vagaPreenchida ? Colors.teal : const Color.fromARGB(255, 150, 0, 0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Vaga $numeroVaga',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
