import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:resep_mamah/style/theme.dart';

class SideNav extends StatefulWidget {
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final int breakfast = 0;
  final int lunch = 1;
  final int dinner = 2;
  int currIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void setIndex(index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.15,
        height: size.height,
        margin: EdgeInsets.only(top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: GestureDetector(
                onTap: () {
                  setIndex(breakfast);
                },
                child: CustomFont(
                  text: "Breakfast",
                  textColor:
                      currIndex == breakfast ? secondColorDark : fontColor,
                  textWeight: FontWeight.bold,
                  textSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: GestureDetector(
                onTap: () {
                  setIndex(lunch);
                },
                child: CustomFont(
                    text: "Lunch",
                    textColor: currIndex == lunch ? secondColorDark : fontColor,
                    textWeight: FontWeight.bold,
                    textSize: 16),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: GestureDetector(
                onTap: () {
                  setIndex(dinner);
                },
                child: CustomFont(
                    text: "Dinner",
                    textColor:
                        currIndex == dinner ? secondColorDark : fontColor,
                    textWeight: FontWeight.bold,
                    textSize: 16),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            IconButton(
              icon: Icon(
                EvaIcons.settings2Outline,
                color: fontColor,
                size: 18,
              ),
              onPressed: null,
            )
          ],
        ));
  }
}
