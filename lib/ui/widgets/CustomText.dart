part of 'widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final TextAlign textAlign;

  CustomText({
    this.text,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: textWeight,
        fontSize: textSize,
        color: textColor,
      )),
    );
  }
}
