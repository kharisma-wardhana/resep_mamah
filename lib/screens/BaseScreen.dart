import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:resep_mamah/screens/home/HomeScreen.dart';
import 'package:resep_mamah/style/theme.dart';
import 'package:resep_mamah/widgets/CustomAppBar.dart';
import 'package:resep_mamah/widgets/SideNav.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          title: "Resep mamah",
          showBackbtn: false,
          widgets: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(
                EvaIcons.search,
                color: fontColor,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                EvaIcons.gridOutline,
                color: fontColor,
              ),
            )
          ],
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              SideNav(),
              Container(
                width: size.width * 0.88,
                height: size.height,
                child: HomeScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
