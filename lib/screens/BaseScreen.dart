import 'package:flutter/material.dart';
import 'package:resep_mamah/style/theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:resep_mamah/screens/home/HomeScreen.dart';
import 'package:resep_mamah/widgets/CustomAppBar.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Resep mamah",
        showBackbtn: false,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
                width: size.width * 0.2,
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
                      child: CustomFont(
                        text: "Breakfast",
                        textColor: secondColorDark,
                        textWeight: FontWeight.bold,
                        textSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: CustomFont(
                          text: "Lunch",
                          textColor: fontColor,
                          textWeight: FontWeight.bold,
                          textSize: 16),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: CustomFont(
                          text: "Dinner",
                          textColor: fontColor,
                          textWeight: FontWeight.bold,
                          textSize: 16),
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
                )),
            Container(
              width: size.width * 0.8,
              height: size.height,
              child: HomeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
