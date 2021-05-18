import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      (Column(children: [
        SizedBox(height: 60.0),
        Container(
          height: 692.0,
          width: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/data.png"),
              fit: BoxFit.cover,
            ),
          ),
        )
      ])),
      Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "upsell",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
      ),
    ]);
  }
}
