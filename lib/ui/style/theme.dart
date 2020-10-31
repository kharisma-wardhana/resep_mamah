import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
final Color mainColor = Color(0xFFD1D3DB);
final Color mainColorDark = Color(0xFFB0BAD4);
final Color secondColor = Color(0xFFFF8B73);
final Color secondColorDark = Color(0xFFFF785B);
final Color fontColor = Color(0xFF3C556D);
final Color titleColor = Color(0xFF00203F);

final double titleSize = 18;
final double headingSize = 20;
final double defaultMargin = 24;

TextStyle titleStyle = GoogleFonts.poppins().copyWith(
    color: titleColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none);

TextStyle infoStyle = GoogleFonts.poppins().copyWith(
    color: fontColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none);

InputDecoration inputStyle = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
    border: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: new BorderSide(
        color: Colors.grey,
        width: 1.2,
      ),
    ),
    errorBorder: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Colors.deepOrange,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: Colors.deepOrange[800],
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: new OutlineInputBorder(
      borderSide: new BorderSide(
        color: fontColor,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    hintStyle: infoStyle,
    hintText: 'Placeholder');
