import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const TipRow({super.key, required this.tObj, required this.isActive , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tObj["name"],
              style: TextStyle(
                  color: isActive
                      ? TColor.primary
                      : TColor.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.navigate_next_rounded,
              color: isActive
                  ? TColor.primary
                  : TColor.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}