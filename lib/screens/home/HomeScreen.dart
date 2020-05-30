import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
      child: Row(
        children: <Widget>[
          Container(
              width: size.width * 0.2,
              height: size.height,
              child: Column(
                children: <Widget>[
                  CustomFont(
                    text: "Breakfast",
                    textColor: mainColor,
                    textWeight: FontWeight.bold,
                    textSize: 16,
                  ),
                  CustomFont(
                      text: "Lunch",
                      textColor: mainColor,
                      textWeight: FontWeight.bold,
                      textSize: 16),
                  CustomFont(
                      text: "Dinner",
                      textColor: mainColor,
                      textWeight: FontWeight.bold,
                      textSize: 16),
                  IconButton(
                    icon: Icon(
                      EvaIcons.settings2Outline,
                      color: mainColor,
                      size: 16,
                    ),
                    onPressed: null,
                  )
                ],
              )),
          Container(
            width: size.width * 0.8,
            height: size.height,
            child: Column(
              children: <Widget>[
                CustomFont(
                  text: "Content",
                  textSize: titleSize,
                  textWeight: FontWeight.bold,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
