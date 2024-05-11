
import 'package:dietandfitness/Theme/theme_helper.dart';
import 'package:dietandfitness/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA70002,
    borderRadius: BorderRadius.circular(15.h),
  );
  static BoxDecoration get gradientGreenAToPrimary => BoxDecoration(
    borderRadius: BorderRadius.circular(20.h),
    gradient: LinearGradient(
      begin: const Alignment(0.0,0),
      end: const Alignment(1.0,1),
      colors: [appTheme.greenA200, theme.colorScheme.primary],
    )
  );
  static BoxDecoration get gradientGreenAToPrimaryTL39 => BoxDecoration(
      borderRadius: BorderRadius.circular(39.h),
      gradient: LinearGradient(
        begin: const Alignment(0.0,0),
        end: const Alignment(1.0,1),
        colors: [appTheme.greenA200, theme.colorScheme.primary],
      )
  );
  static BoxDecoration get gradientGreenAToPrimaryTL8 => BoxDecoration(
      borderRadius: BorderRadius.circular(8.h),
      gradient: LinearGradient(
        begin: const Alignment(0.0,0),
        end: const Alignment(1.0,1),
        colors: [appTheme.greenA200, theme.colorScheme.primary],
      )
  );
  static BoxDecoration get gradientGreenAToPrimaryTL17 => BoxDecoration(
      borderRadius: BorderRadius.circular(17.h),
      gradient: LinearGradient(
        begin: const Alignment(0.0,0),
        end: const Alignment(1.0,1),
        colors: [appTheme.greenA200, theme.colorScheme.primary],
      )
  );
  static BoxDecoration get fillRedA => BoxDecoration(
    color: appTheme.redA400,
    borderRadius: BorderRadius.circular(17.h)
  );

}



class CustomIconButton extends StatelessWidget {
   final Alignment? alignment;
   final double? height;
   final double? width;
   final EdgeInsetsGeometry? padding;
   final BoxDecoration? decoration;
   final Widget? child;
   final VoidCallback? onTap;

  const CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: IconButton(
      padding: EdgeInsets.all(0),
      icon: Container(
        height: height ?? 0,
        width: width ?? 0,
        padding: padding ?? EdgeInsets.zero,
        decoration: decoration
            ?? BoxDecoration(
                color: appTheme.orangeA200,
                borderRadius: BorderRadius.circular(15.h)
            ),
        child: child,
      ),
      onPressed: onTap,
    ),
  );
}
