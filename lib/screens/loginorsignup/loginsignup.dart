import 'package:flutter/material.dart';

import 'package:brew_crew/screens/authenticate/sign_in.dart';

import 'package:brew_crew/screens/authenticate/register.dart';

void main() {
  runApp(LoginSignup());
}

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Stack(children: [
      (Column(children: [
        SizedBox(height: 0.0),
        Container(
          height: 752.0,
          width: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/mansit.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        )
      ])),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(
            top: 280,
            left: 80,
            child: Container(
                height: 53.0,
                width: 210,
                child: GestureDetector(
                  onTap: () {
                    Future push = Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.deepOrange.shade600,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23.0,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            left: 80,
            top: 350,
            child: Container(
                height: 51.0,
                width: 202,
                child: GestureDetector(
                  onTap: () {
                    Future push = Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.grey.shade300,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                            color: Colors.deepOrange.shade600,
                            fontWeight: FontWeight.w400,
                            fontSize: 23.0,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
              left: 6,
              top: 75,
              child: Container(
                height: 110.0,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Upsell logo PNG.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
        ]),
      )
    ]);
  }
}
