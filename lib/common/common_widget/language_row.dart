import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';

class LanguageRow extends StatelessWidget {
  final Map tObj;
  final VoidCallback onPressed;
  final bool isActive;
  const LanguageRow({super.key, required this.tObj, required this.onPressed, required this.isActive});

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
                color: isActive ? TColor.primary : TColor.secondaryText,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            ),

            if(isActive)
              Image.asset(
                "assets/tick.png",
                width: 30,
                height: 30,
              ),
          ],
        ),
      ),
    );
  }
}
