import 'package:flutter/material.dart';
import 'package:shypclone/utils/color_tokens.dart';

class SmallChip extends StatelessWidget {
  final String text;
  const SmallChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
