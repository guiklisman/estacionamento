import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String erro;
  const ErrorWidget({super.key, required this.erro});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Erro ao obter os dados: $erro',
      ),
    );
  }
}
