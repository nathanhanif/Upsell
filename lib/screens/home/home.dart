import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: SettingsForm());
          });
    }

    ;

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Stack(children: [
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
            //title: Text(
            //  "upsell",
            //  style: TextStyle(color: Colors.black),
            // ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                padding: EdgeInsets.only(right: 145),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text("Update Profile"),
                padding: EdgeInsets.only(right: 10),
                onPressed: () => _showSettingsPanel(),
              ),
            ],
          ),
          body: BrewList(),
        ),
      ]),
    );
  }
}
