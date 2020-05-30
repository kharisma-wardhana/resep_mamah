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
      width: size.width * 0.8,
      height: size.height,
      child: Column(
        children: <Widget>[
          CustomFont(
            text: "Content",
            textSize: titleSize,
            textWeight: FontWeight.bold,
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: mainColorDark, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              width: size.width * 0.7,
              height: size.height * 0.8,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: <Color>[mainColor, mainColorDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text("Menu"),
            ),
          ),
        ],
      ),
    );
  }
}
