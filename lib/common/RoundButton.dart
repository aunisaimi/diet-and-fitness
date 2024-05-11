import 'package:dietandfitness/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType {primary,primaryText}

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundButtonType type;
  final double fontSize;
  final FontWeight fontWeight;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = RoundButtonType.primary,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: type == RoundButtonType.primary ? TColor.white : TColor.primary,
      color:type == RoundButtonType.primary ? TColor.primary : TColor.white,
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),

      child: Text(
        title,
        style: TextStyle(
            color: type == RoundButtonType.primary ? TColor.white : TColor.primary,
            fontSize: fontSize,
            fontWeight: fontWeight,
        ),
      ),
    );
  }
}
