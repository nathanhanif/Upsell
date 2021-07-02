import 'package:flutter/material.dart';
import 'package:redo/layout/bod.dart';
import 'package:redo/screens/home/home.dart';

class Dlog extends StatelessWidget {
  const Dlog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "About EasySell",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Future push = Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Bod()));
          //     },
          //   ),
          // ]
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.colorBurn),
                image: AssetImage("images/idea.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Text(
                  "Easy  Sell  is  a  Mobile  App  that  connects  buyers  and  sellers  in  your  locality.  (i.e  -  you  are  able  to  interact  with buyers and  sellers  within  your  work,  study  and  home  area  this  mobile  solution  helps  you  access  services  near  you  instaed  of  going  to  search  for  them  elsewhere Buyers  and  sellers  have  the  advantage  of  meeting  and  interacting  before  purchases  as  they  are  in  the  same locality)",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: ("fonts/Aalto Sans Essential Alt Light.otf"),
                      color: Colors.white)))
        ]));
  }
}
