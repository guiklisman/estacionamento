import 'package:flutter/material.dart';

class EspacoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const EspacoWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
