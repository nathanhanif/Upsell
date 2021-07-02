import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: 180,
          child: Drawer(
              child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 20, 0, 50),
                color: Theme.of(context).primaryColor,
                //child: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 90,

                        //padding: EdgeInsets.fromLTRB(100, 10, 15, 0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "images/white orng.jpg",
                              ),

                              // alignment: Alignment.bottomLeft,
                              fit: BoxFit.fitHeight,
                            ))),
                  ],
                ),
              ),
            ],
          ))),
    ]);
  }
}
