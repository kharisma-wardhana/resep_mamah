import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:resep_mamah/screens/home/CardFood.dart';
import 'package:resep_mamah/style/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: secondColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: mainColorDark, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomFont(
                      text: "Desert",
                      textSize: 14,
                      textColor: Colors.white,
                      textWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: mainColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomFont(
                      text: "Main Course",
                      textSize: 14,
                      textColor: fontColor,
                      textWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: mainColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomFont(
                      text: "Appetizer",
                      textSize: 14,
                      textColor: fontColor,
                      textWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CardFood(),
        ],
      ),
    );
  }
}
