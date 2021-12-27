import 'package:flutter/material.dart';

import 'nav_button.dart';

class NavBar extends StatelessWidget {
  bool isSelected(String name, BuildContext context) {
    if (ModalRoute.of(context)!.settings.name.toString() ==
        name.toLowerCase()) {
      return true;
    }
    return false;
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
            alignment: Alignment.topCenter,
            width: (MediaQuery.of(context).size.width * 0.175).clamp(300, 360),
            height: (MediaQuery.of(context).size.height * 0.85),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).accentColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: (7.0),
                  spreadRadius: (-4),
                ),
              ],
            ),
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Minebird",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.subtitle1!.color),
                ),
                // ignore: unnecessary_statements
                NavButton(
                    text: "Home",
                    selected: isSelected("home", context),
                    onClicked: () {
                      !isSelected("home", context)
                          ? Navigator.of(context).pushNamed('home')
                          // ignore: unnecessary_statements
                          : null;
                    },
                    icon: Icons.home),
                NavButton(
                    text: "Accounts",
                    selected: isSelected("accounts", context),
                    onClicked: () {
                      !isSelected("accounts", context)
                          ? Navigator.of(context).pushNamed('accounts')
                          // ignore: unnecessary_statements
                          : null;
                    },
                    icon: Icons.account_circle_rounded),
                NavButton(
                    text: "Instances",
                    selected: isSelected("instances", context),
                    onClicked: () {
                      !isSelected("instances", context)
                          ? Navigator.of(context).pushNamed('instances')
                          // ignore: unnecessary_statements
                          : null;
                    },
                    icon: Icons.library_add),
                NavButton(
                    text: "Mods",
                    selected: isSelected("mods", context),
                    onClicked: () {
                      !isSelected("mods", context)
                          ? Navigator.of(context).pushNamed('mods')
                          // ignore: unnecessary_statements
                          : null;
                    },
                    icon: Icons.view_module),
                NavButton(
                    text: "Settings",
                    selected: isSelected("settings", context),
                    onClicked: () {
                      !isSelected("settings", context)
                          ? Navigator.of(context).pushNamed('settings')
                          // ignore: unnecessary_statements
                          : null;
                    },
                    icon: Icons.settings),
                Text(
                  "v0.0.1",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.subtitle1!.color),
                ),
              ],
            )),
      ),
    ]);
  }
}
