import 'package:flutter/material.dart';
import 'package:shypclone/utils/color_tokens.dart';

class CtaButton extends StatelessWidget {
  final bool isConfirm;
  final bool isRedFilled;
  final bool isFullWidth;
  final String buttonText;
  final VoidCallback onPressed;

  const CtaButton({
    super.key,
    this.isConfirm = false,
    this.isRedFilled = false,
    this.isFullWidth = true,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: isFullWidth ? double.infinity : _width / 2 - 18,
        decoration: BoxDecoration(
          color: isRedFilled
              ? activeRed
              : (isConfirm ? Colors.green : Colors.white),
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: !isConfirm ? activeRed : Colors.transparent,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: isRedFilled
                  ? Colors.white
                  : (isConfirm ? Colors.white : activeRed),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
