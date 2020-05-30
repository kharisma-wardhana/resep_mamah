import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
final Color mainColor = const Color(0xFF4B4EA2);
final Color mainColorDark = const Color(0xFF0F106A);
final Color secondColor = const Color(0xFFF3BF56);
final Color secondColorDark = const Color(0xFFFC9F1B);
final Color fontColor = const Color(0xFFA4A7CE);
final Color titleColor = const Color(0xFFD8D8FC);

final double titleSize = 18.0;
final double headingSize = 20.0;

// FontStyle
class CustomFont extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;

  const CustomFont(
      {Key key, this.text, this.textSize, this.textWeight, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontWeight: textWeight, fontSize: textSize, color: textColor)),
    );
  }
}
