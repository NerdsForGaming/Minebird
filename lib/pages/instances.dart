import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minebird/utils/file.dart';
import 'package:minebird/widgets/nav_bar.dart';
import 'package:minebird/widgets/dialog.dart';

import '../widgets/card.dart';

List<String> instanceNames = [];
List<String> url = [];
String filename = "";
String json = "";
int index = 0;

class InstancesPage extends StatefulWidget {
  InstancesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InstancesPageState createState() => _InstancesPageState();
}

class _InstancesPageState extends State<InstancesPage> {
  final instanceNameController = TextEditingController();
  final urlController = TextEditingController();

  void addCard(String title, String imageUrl) {
    setState(() {
      instanceNames.add(title);
      url.add(imageUrl);
    });
  }

  @override
  void dispose() {
    instanceNameController.dispose();
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
                        body: InstanceCard(title: instanceNames, url: url),
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
                  onPressed: () => SDialog.showWizardDialog(
                      () => {
                            Navigator.of(context).pop(),
                            addCard(instanceNameController.text.toString(),
                                urlController.text.toString()),
                            MinebirdIO.createInstance(instanceNames.last,
                                urlController.text, "1.18.1"),
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Instance created!'),
                                action: new SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    MinebirdIO.deleteInstance(
                                        instanceNames.last);
                                    setState(() {
                                      instanceNames.removeLast();
                                    });
                                  },
                                ),
                              ),
                            )
                          },
                      () => {
                            Navigator.of(context).pop(),
                          },
                      context,
                      "Add Instance",
                      "Instance Name",
                      "Image Url",
                      instanceNameController,
                      urlController),
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
