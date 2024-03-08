import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color colorBackground;
  final Function onTap;

  const DefaultButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.colorBackground,
    required this.onTap,
  });

  @override
  State<DefaultButtonWidget> createState() => _DefaultButtonWidgetState();
}

class _DefaultButtonWidgetState extends State<DefaultButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(widget.icon),
      label: Text(widget.title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.colorBackground,
        ),
      ),
      onPressed: widget.onTap(),
    );
  }
}
