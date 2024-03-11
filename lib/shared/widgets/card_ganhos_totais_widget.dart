import 'package:flutter/material.dart';

class CardGanhosTotaisWidget extends StatefulWidget {
  final String totalGanhoHoje;
  final int totalClientesHoje;
  final void Function() onTap;
  final double? largura;
  final double? altura;
  final double? tamanhoFonte;
  const CardGanhosTotaisWidget({
    super.key,
    required this.totalGanhoHoje,
    required this.totalClientesHoje,
    required this.onTap,
    this.largura = 400,
    this.altura = 150,
    this.tamanhoFonte = 25,
  });

  @override
  State<CardGanhosTotaisWidget> createState() => _CardGanhosTotaisWidgetState();
}

class _CardGanhosTotaisWidgetState extends State<CardGanhosTotaisWidget> {
  bool mostraValores = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.altura,
      width: widget.largura,
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
                  'Ganho hoje: ${mostraValores ? widget.totalGanhoHoje : '******'}',
                  style: TextStyle(
                    fontSize: widget.tamanhoFonte,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Clientes hoje: ${mostraValores ? widget.totalClientesHoje : '**'}',
                  style: TextStyle(
                    fontSize: widget.tamanhoFonte,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onTap();
                  },
                  child: Text(
                    'ver histórico',
                    style: TextStyle(
                      fontSize: widget.tamanhoFonte! - 8,
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
