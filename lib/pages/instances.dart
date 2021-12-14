import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minebird/widgets/nav_bar.dart';
import 'package:minebird/widgets/dialog.dart';

import '../widgets/card.dart';

List<String> instanceNames = [];

class InstancesPage extends StatefulWidget {
  InstancesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InstancesPageState createState() => _InstancesPageState();
}

class _InstancesPageState extends State<InstancesPage> {
  final textEditingController = TextEditingController();

  void addCard(String title) {
    setState(() {
      instanceNames.add(textEditingController.text);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(right: 50, left: 350),
                padding: EdgeInsets.all(70),
                child: Stack(
                  children: [
                    Text(
                      "Instances",
                      style: TextStyle(fontSize: 36),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 56),
                      child: Scaffold(
                        body: InstanceCard(
                          title: instanceNames,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NavBar(),
            Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(right: 50, left: 350),
                  child: Visibility(
                      visible: instanceNames.length < 1,
                      child: Text(
                        "You have no instances",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.subtitle1!.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ))),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(36),
                child: FloatingActionButton(
                  onPressed: () => SDialog.setDialogShown(
                      () => {
                            Navigator.of(context).pop(),
                            addCard(textEditingController.text.toString())
                          },
                      () => {
                            Navigator.of(context).pop(),
                          },
                      context,
                      "Add Instance",
                      "Instance Name:",
                      textEditingController),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
