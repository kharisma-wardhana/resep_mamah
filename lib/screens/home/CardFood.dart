import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:resep_mamah/screens/home/ListIngredient.dart';
import 'package:resep_mamah/style/theme.dart';

class CardFood extends StatefulWidget {
  @override
  _CardFoodState createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.all(10.0),
          child: Container(
            width: size.width * 0.7,
            height: size.height * 0.72,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: <Color>[mainColor, mainColorDark],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.3),
                ),
                CustomFont(
                  text: "Pudding Coklat",
                  textSize: titleSize,
                  textColor: secondColorDark,
                  textWeight: FontWeight.bold,
                ),
                CustomFont(
                  text:
                      "Pudding coklat dengan rasa coklat yang bener-bener asli seperti buatan nyokap.",
                  textSize: 12,
                  textColor: titleColor,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFont(
                  text: "Ingredients : ",
                  textSize: titleSize,
                  textColor: secondColorDark,
                  textWeight: FontWeight.bold,
                ),
                ListIngredient(),
              ],
            ),
          ),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: secondColorDark,
                    offset: Offset(1.5, 2),
                    blurRadius: 1.5,
                  ),
                ], color: secondColor, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    EvaIcons.heart,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ),
              Container(
                width: size.width * 0.62,
                height: size.height * 0.28,
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: mainColorDark,
                      offset: Offset(2, 3),
                      blurRadius: 15,
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/pudding_coklat.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
