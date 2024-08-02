import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBold extends StatelessWidget {
  const TextBold({
    super.key,
    this.color,
    this.height,
    this.overflow,
    this.softWrap,
    this.fontSize,
    this.maxLines,
    this.textAlign,
    required this.text,
    required this.fontWeight,
  });

  final String text;
  final Color? color;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: GoogleFonts.poppins(fontWeight: fontWeight).fontFamily,
        overflow: overflow,
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
