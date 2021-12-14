import 'package:flutter/material.dart';

class NavButton extends StatelessWidget{
  const NavButton({
    Key? key,
    required this.text,
    this.selected = false,
    this.vSpacing = 0,
    this.hSpacing = 0,
    this.onClicked,
    required this.icon,
  }) : super(key: key);

  final String text;
  final bool selected;
  final double vSpacing;
  final double hSpacing;
  final GestureTapCallback? onClicked;
  final IconData icon;

  Widget build(BuildContext context){
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: selected ? Colors.transparent : Colors.black,
                    offset: Offset(0, 2),
                    blurRadius: (4.0),
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.circular(25),
                color: selected ? Theme.of(context).textTheme.subtitle1!.color : Theme.of(context).primaryColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: onClicked,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        selected: selected,
                        title: Text(text, style: TextStyle(color: selected ? Theme.of(context).primaryColor: Theme.of(context).textTheme.subtitle1!.color)),
                        leading: Icon(icon, color: selected ? Theme.of(context).primaryColor: Theme.of(context).textTheme.subtitle1!.color,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: vSpacing, width: hSpacing,),
          ],
        ),
      ],
    );
  }
}