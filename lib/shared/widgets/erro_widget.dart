import 'package:flutter/material.dart';

class ErroWidget extends StatelessWidget {
  final String erro;
  const ErroWidget({super.key, required this.erro});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Erro ao obter os dados: $erro',
      ),
    );
  }
}
