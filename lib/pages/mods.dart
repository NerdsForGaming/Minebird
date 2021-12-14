import 'package:flutter/material.dart';
import 'package:minebird/widgets/nav_bar.dart';

class ModsPage extends StatelessWidget{
  ModsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: NavBar(),
        )
    );
  }
}