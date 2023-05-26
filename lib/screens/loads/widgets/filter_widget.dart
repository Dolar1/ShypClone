import 'package:flutter/material.dart';
import 'package:shypclone/common_widgets/bordered_chip.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 35,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            BorderedChip(text: "All (10)", isActive: true),
            SizedBox(width: 10),
            BorderedChip(text: "Pending (6)"),
            SizedBox(width: 10),
            BorderedChip(text: "In Progress (2)"),
            SizedBox(width: 10),
            BorderedChip(text: "Completed (2)")
          ],
        ),
      ),
    );
  }
}
