import 'package:flutter/material.dart';

class ColoredMessageBox extends StatelessWidget {
  const ColoredMessageBox({
    super.key,
    required this.color,
    required this.message,
  });

  final Color color;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      width: 300,
      height: 300,
      child: Text(
        message,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
