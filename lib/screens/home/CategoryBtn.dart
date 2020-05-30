import 'package:flutter/material.dart';
import 'package:resep_mamah/style/theme.dart';

class CategoryBtn extends StatefulWidget {
  final int selectedIndex;
  @required
  final Function setSelectedIndex;

  CategoryBtn({
    Key key,
    this.selectedIndex = 0,
    this.setSelectedIndex,
  }) : super(key: key);

  @override
  _CategoryBtnState createState() => _CategoryBtnState();
}

class _CategoryBtnState extends State<CategoryBtn> {
  static const int APPETIZER = 0;
  static const int MAIN_COURSE = 1;
  static const int DESERT = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                widget.setSelectedIndex(APPETIZER);
              },
              color:
                  widget.selectedIndex == APPETIZER ? secondColor : mainColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: mainColorDark, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomFont(
                text: "Appetizer",
                textSize: 14,
                textColor: widget.selectedIndex == APPETIZER
                    ? Colors.white
                    : fontColor,
                textWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            RaisedButton(
              onPressed: () {
                widget.setSelectedIndex(MAIN_COURSE);
              },
              color:
                  widget.selectedIndex == MAIN_COURSE ? secondColor : mainColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: mainColorDark, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomFont(
                text: "Main Course",
                textSize: 14,
                textColor: widget.selectedIndex == MAIN_COURSE
                    ? Colors.white
                    : fontColor,
                textWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            RaisedButton(
              onPressed: () {
                widget.setSelectedIndex(DESERT);
              },
              color: widget.selectedIndex == DESERT ? secondColor : mainColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: mainColorDark, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomFont(
                text: "Desert",
                textSize: 14,
                textColor:
                    widget.selectedIndex == DESERT ? Colors.white : fontColor,
                textWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
