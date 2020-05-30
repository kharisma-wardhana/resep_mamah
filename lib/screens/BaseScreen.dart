import 'package:flutter/material.dart';
import 'package:resep_mamah/style/theme.dart';
import 'package:resep_mamah/screens/home/HomeScreen.dart';
import 'package:resep_mamah/widgets/CustomAppBar.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(items: null),
    );
  }
}
