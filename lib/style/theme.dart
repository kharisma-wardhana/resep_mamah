import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
final Color mainColor = const Color(0xFFD1D3DB);
final Color mainColorDark = const Color(0xFFB0BAD4);
final Color secondColor = const Color(0xFFFF8B73);
final Color secondColorDark = const Color(0xFFFF785B);
final Color fontColor = const Color(0xFF3C556D);
final Color titleColor = const Color(0xFF00203F);

final double titleSize = 18.0;
final double headingSize = 20.0;

// FontStyle
class CustomFont extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final TextAlign textAlign;

  const CustomFont({
    Key key,
    this.text,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontWeight: textWeight,
        fontSize: textSize,
        color: textColor,
      )),
    );
  }
}
