import 'package:flutter/material.dart';
import 'package:technical_test_dna/app/helper/helper.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final double? paddingY;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? borderRadius;
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    this.paddingY,
    this.borderColor,
    this.fontWeight,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: paddingY ?? 13.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: color ?? Constants.get.primaryColor,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? Colors.white,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
