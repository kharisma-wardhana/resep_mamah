import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
            side: BorderSide(color: mainColor, width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(15.0),
          child: Container(
            width: size.width * 0.7,
            height: size.height * 0.75,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: <Color>[mainColor, mainColorDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.3),
                ),
                Center(
                  child: CustomFont(
                    text: "Pudding Coklat",
                    textSize: titleSize,
                    textColor: fontColor,
                    textWeight: FontWeight.bold,
                  ),
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
                  textColor: fontColor,
                  textWeight: FontWeight.bold,
                ),
                CustomFont(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                  textSize: 12,
                  textColor: titleColor,
                )
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
                margin: EdgeInsets.only(top: 10, left: 5),
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: mainColorDark,
                    offset: Offset(2, 3),
                    blurRadius: 2,
                  ),
                ], color: secondColorDark, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    EvaIcons.heart,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ),
              Container(
                width: size.width * 0.625,
                height: size.height * 0.282,
                margin: EdgeInsets.only(top: 35),
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
