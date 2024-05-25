// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign alignText;
  int? maxLines;
  final Color? color;
  final double fontSize;
  final bool softWrap;
  final FontWeight fontWeight;
  final double? minFontSize;
  final bool ellipsisText;
  final double? lineHeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;

  AppText({
    Key? key,
    required this.text,
    this.color,
    required this.fontSize,
    this.alignText = TextAlign.start,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.ellipsisText = true,
    this.softWrap = true,
    this.minFontSize,
    this.textDecoration,
    this.fontFamily,
    this.lineHeight,  this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignText,
      maxLines: maxLines,
      // minFontSize: minFontSize ?? 8,
      overflow:overflow??  TextOverflow.ellipsis ,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        height: lineHeight,
        decoration: textDecoration,
      ),
    );
  }
}
