import 'package:flutter/material.dart';

class InstanceCard extends StatefulWidget {
  const InstanceCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final List<String> title;

  @override
  _InstanceCardState createState() => _InstanceCardState();
}

class _InstanceCardState extends State<InstanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: GridView.builder(
        itemCount: widget.title.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Text(
                      widget.title[index],
                      style: TextStyle(
                        fontSize: 48,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.title.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete),
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings),
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color),
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
            ),
          );
        },
      ),
    );
  }
}
