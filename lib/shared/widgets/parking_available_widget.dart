import 'package:flutter/material.dart';

class ParkingAvailableWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final String title;
  final String? value;
  const ParkingAvailableWidget(
      {super.key,
      this.height = 50,
      this.width = 170,
      required this.title,
      this.value = ''});

  @override
  State<ParkingAvailableWidget> createState() => _ParkingAvailableWidgetState();
}

class _ParkingAvailableWidgetState extends State<ParkingAvailableWidget> {
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
        ),
      ),
    );
  }
}
