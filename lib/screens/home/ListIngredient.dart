import 'package:flutter/material.dart';
import 'package:resep_mamah/style/theme.dart';

class ListIngredient extends StatefulWidget {
  @override
  _ListIngredientState createState() => _ListIngredientState();
}

class _ListIngredientState extends State<ListIngredient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Wrap(
        runSpacing: 10,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          _buildIngredient(),
          _buildIngredient(),
          _buildIngredient(),
          _buildIngredient(),
          _buildIngredient(),
          _buildIngredient(),
        ],
      ),
    );
  }

  Widget _buildIngredient() {
    return Row(
      children: <Widget>[
        CustomFont(
          text: String.fromCharCode(0x2022),
          textSize: 14,
          textColor: fontColor,
        ),
        SizedBox(
          width: 5,
        ),
        CustomFont(
          text: "Nutrijel Coklat",
          textSize: 12,
          textColor: titleColor,
        ),
      ],
    );
  }
}
