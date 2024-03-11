import 'package:flutter/material.dart';

class VagaDisponivelWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final String title;
  final String? value;
  final double? sizeTitle;
  const VagaDisponivelWidget(
      {super.key,
      this.height = 50,
      this.width = 170,
      required this.title,
      this.value = '',
      this.sizeTitle = 15});

  @override
  State<VagaDisponivelWidget> createState() => _VagaDisponivelWidgetState();
}

class _VagaDisponivelWidgetState extends State<VagaDisponivelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          widget.title + widget.value!,
          style: TextStyle(fontSize: widget.sizeTitle),
        ),
      ),
    );
  }
}
