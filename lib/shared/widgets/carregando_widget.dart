import 'package:flutter/material.dart';

class CarregandoWidget extends StatelessWidget {
  const CarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
