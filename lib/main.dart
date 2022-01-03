import 'package:flutter/material.dart';
import 'package:minebird/pages/accounts.dart';
import 'package:minebird/pages/home.dart';
import 'package:minebird/pages/instances.dart';
import 'package:minebird/pages/mods.dart';
import 'package:minebird/pages/settings.dart';
import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(Minebird());
}

class Minebird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DesktopWindow.setMinWindowSize(Size(900, 720));
    //MinebirdIO.getApplicationDir().then((value) => print("value"));
    // MinebirdIO.addInstanceJSON("instanceName", 1);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto Mono',
        primaryColor: Color(0xff2F302C),
        accentColor: Color(0xff40413C),
        backgroundColor: Color(0xff252523),
        textTheme: TextTheme(
          headline6: TextStyle(color: Color(0xffFFFEE1)),
          bodyText2: TextStyle(color: Color(0xffFFFEE1)),
          subtitle1: TextStyle(color: Color(0xffFFFEE1)),
        ),
      ),
      home: HomePage(title: 'Minebird - Home'),
      routes: {
        'home': (BuildContext context) => HomePage(title: "Minebird - Home"),
        'accounts': (BuildContext context) =>
            AccountsPage(title: "Minebird - Accounts"),
        'instances': (BuildContext context) =>
            InstancesPage(title: "Minebird - Instances"),
        'mods': (BuildContext context) => ModsPage(title: "Minebird - Mods"),
        'settings': (BuildContext context) =>
            SettingsPage(title: "Minebird - Settings"),
      },
      initialRoute: 'home',
    );
  }
}
