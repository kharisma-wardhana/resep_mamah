import 'package:flutter/material.dart';
import 'package:resep_mamah/screens/home/CardFood.dart';
import 'package:resep_mamah/screens/home/CategoryBtn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void setSelectedIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: <Widget>[
          CategoryBtn(
            selectedIndex: _selectedIndex,
            setSelectedIndex: (index) {
              setSelectedIndex(index);
            },
          ),
          // Container(
          //   width: size.width * 0.6,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       return CardFood();
          //     },
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardFood();
              },
            ),
          ),
          // CardFood(),
          // CardFood(),
          // CardFood(),
        ],
      ),
    );
  }
}
