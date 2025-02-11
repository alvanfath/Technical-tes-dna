import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign align;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  const TextWidget({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xff2D3338),
    this.align = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Poppins',
        decoration: TextDecoration.none,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
      textAlign: align,
    );
  }
}
