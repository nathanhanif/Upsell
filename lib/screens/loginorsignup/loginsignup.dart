import 'package:flutter/material.dart';
import 'package:redo/screens/authenticate/sign_in.dart';
import 'package:redo/screens/authenticate/register.dart';

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
    // return Stack(children: [
    //   (Column(children: [
    //     SizedBox(height: 0.0),
    //     Container(
    //       height: 752.0,
    //       width: 600,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage("images/mansit.jpg"),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     )
    //   ])),
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/mansit.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: 80,
            top: 355,
            child: Container(
              height: 53,
              width: 210,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.orange.shade900.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                )
              ]),
              child: RaisedButton(
                color: Colors.grey.shade300,
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                      color: Colors.deepOrange.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      fontFamily: 'Montserrat'),
                ),
                onPressed: () {
                  Future push = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(58.0),
                ),
              ),
            )),
        Positioned(
            left: 10,
            top: 105,
            child: Container(
              height: 90.0,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Upsell logo PNG.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )),
        Positioned(
            left: 80,
            top: 285,
            child: Container(
              height: 53,
              width: 210,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  spreadRadius: 0.1,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                )
              ]),
              child: RaisedButton(
                color: Colors.deepOrange.shade600,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                      fontFamily: 'Montserrat'),
                ),
                onPressed: () {
                  Future push = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(58.0),
                ),
              ),
            )),
      ]),
    );
  }
}
