import 'package:redo/hp.dart';
import 'package:redo/layout/bod.dart';
import 'package:redo/models/brew.dart';
import 'package:redo/screens/home/brew_list.dart';
import 'package:redo/screens/home/brew_tile.dart';
import 'package:redo/screens/home/settings_form.dart';
import 'package:redo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:redo/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redo/layout/main_drawer.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  bool isSearching = false;

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
                image: AssetImage("images/sell.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ])),
        Scaffold(
            // drawer: Maindrawer(),
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: !isSearching
                  ? Text(
                      "Browse Stores",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    )
                  : TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Search Store or Category",
                          hintStyle: TextStyle(color: Colors.white))),
              actions: <Widget>[
                isSearching
                    ? IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            this.isSearching = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            this.isSearching = true;
                          });
                        },
                      ),

                // IconButton(
                //     icon: Icon(
                //       Icons.notifications,
                //     ),
                //     padding: EdgeInsets.only(right: 15),
                //     onPressed: () {}),

                // IconButton(
                //   icon: Icon(Icons.logout),
                //   // label: Text("logout"),
                //   padding: EdgeInsets.only(right: 0),
                //   onPressed: () async {
                //     await _auth.signOut();
                //   },
                // ),
              ],
            ),
            body: BrewList()),
      ]),
    );
  }
}
