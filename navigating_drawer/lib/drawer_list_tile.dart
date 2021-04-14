import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String text;
  IconData icon;
  Function onTab;

  CustomListTile(
      {@required this.text, @required this.icon, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12))),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTab,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
