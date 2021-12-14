import 'package:flutter/material.dart';

class SDialog {
  static void setDialogShown(GestureTapCallback? doneCB,
      GestureTapCallback? cancelCB, BuildContext context, String title,
      String fTitle, TextEditingController textEditingController) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
      new SimpleDialog(
        backgroundColor: Theme
            .of(context)
            .accentColor,
        title: new Text(title),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(fTitle),
                Container(
                  margin: EdgeInsets.only(right: 24),
                  child: TextField(
                      controller: textEditingController,
                      cursorColor: Theme
                          .of(context)
                          .textTheme
                          .subtitle1!
                          .color,
                      decoration: InputDecoration(
                        hintText: 'Enter instance name',
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyanAccent,
                            width: 1.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        height: 2.0,
                        color: Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .color,
                      )),
                ),
                SizedBox(height: 24),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 24),
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: doneCB,
                            child: Text(
                              'Done',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: cancelCB,
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}