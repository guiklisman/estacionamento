import 'package:flutter/material.dart';

class DialogCheckVehicle extends StatelessWidget {
  const DialogCheckVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _exibirPopup(context);
      },
      child: const Text('Abrir Popup'),
    );
  }

  Future<void> _exibirPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Título do Popup'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Conteúdo do popup...'),
                Text('Outro texto de exemplo.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
