import 'package:flutter/material.dart';
import 'package:minebird/utils/file.dart';

import 'dialog.dart';

class InstanceCard extends StatefulWidget {
  const InstanceCard({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final List<String> title;
  final List<String> url;
  @override
  _InstanceCardState createState() => _InstanceCardState();
}

class _InstanceCardState extends State<InstanceCard> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: GridView.builder(
        itemCount: widget.title.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: (10.0),
                  spreadRadius: -6,
                ),
              ],
            ),
            child: Card(
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).accentColor,
              child: Stack(
                children: [
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.srcOver),
                          image: NetworkImage(widget.url[index]),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Text(
                          widget.title[index],
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () => SDialog.showConfirmDialog(
                                      () => {
                                            setState(() {
                                              MinebirdIO.deleteInstance(
                                                  widget.title[index]);
                                              widget.title.removeAt(index);
                                            }),
                                            Navigator.of(context).pop(),
                                          },
                                      () => {
                                            Navigator.of(context).pop(),
                                          },
                                      context,
                                      "Delete?",
                                      "This action will delete \"${widget.title[index]}\""),
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .color),
                              IconButton(
                                  onPressed: () => SDialog.showSettingsDialog(
                                      () => {
                                            Navigator.of(context).pop(),
                                          },
                                      () => {
                                            Navigator.of(context).pop(),
                                          },
                                      context,
                                      "Settings",
                                      "Field1",
                                      textEditingController),
                                  icon: Icon(Icons.settings),
                                  color: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .color),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                            color: Theme.of(context).textTheme.subtitle1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
