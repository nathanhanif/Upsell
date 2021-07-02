import 'package:flutter/material.dart';

import 'package:redo/layout/Constants.dart';
import 'package:redo/layout/bod.dart';
import 'package:redo/layout/main_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nathan',
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color(0xFFEEEEEE)),
      home: MyHomePage(title: 'Upsell'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            //padding: EdgeInsets.only(right: 5),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              //padding: EdgeInsets.only(right: 15),
              onPressed: () {}),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Maindrawer(),
      body: Bod(),
    );
  }
}
