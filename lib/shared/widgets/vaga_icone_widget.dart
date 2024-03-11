import 'package:flutter/material.dart';

class VagaIconeWidget extends StatelessWidget {
  final bool vagaPreenchida;
  final String nomeVaga;
  final double? largura;
  final double? altura;

  const VagaIconeWidget({
    super.key,
    required this.vagaPreenchida,
    required this.nomeVaga,
    this.largura = 25,
    this.altura = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: largura,
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
