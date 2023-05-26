import 'package:flutter/material.dart';
import 'package:shypclone/utils/color_tokens.dart';

class BorderedChip extends StatelessWidget {
  final String text;
  final bool isActive;
  const BorderedChip({
    super.key,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: text.length >  100,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: isActive ? activeRed.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          color: isActive ? activeRed : Colors.black,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
