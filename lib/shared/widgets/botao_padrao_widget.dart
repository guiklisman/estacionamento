import 'package:flutter/material.dart';

import '../../app/models/vaga_model.dart';

class BotaoPadraoWidget extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final Color corDeFundo;
  final List<VagaModel> vagas;
  final Future<void> Function() onTap;
  final double? largura;
  final double? altura;

  const BotaoPadraoWidget({
    super.key,
    required this.icone,
    required this.titulo,
    required this.corDeFundo,
    required this.vagas,
    required this.onTap,
    this.largura,
    this.altura,
  });

  @override
  State<BotaoPadraoWidget> createState() => _BotaoPadraoWidgetState();
}

class _BotaoPadraoWidgetState extends State<BotaoPadraoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.altura,
      width: widget.largura,
      child: TextButton.icon(
        icon: Icon(widget.icone),
        label: Text(widget.titulo),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            widget.corDeFundo,
          ),
        ),
        onPressed: () async {
          await widget.onTap();
        },
      ),
    );
  }
}
