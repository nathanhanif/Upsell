import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text feild state

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Stack(children: [
            (Column(children: [
              SizedBox(height: 0.0),
              Container(
                height: 752.0,
                width: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/wave.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ])),
            Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.blue.shade800,
                  elevation: 0.0,
                  title: Text("Login to Upsell"),
                ),
                body: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Positioned(
                              left: 15,
                              top: 55,
                              child: Container(
                                height: 30.0,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "images/Upsell logo PNG.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),

                          Container(
                            height: 60,
                            width: 400,
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "WELCOME ",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 50.0),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 400,
                            padding: EdgeInsets.only(left: 63),
                            child: Text(
                              "BACK!",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 50.0),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Email',
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan.shade500,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan.shade500,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Enter Email";
                              }
                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(val)) {
                                return 'Please enter a valid email Address';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.length < 8 ? "Password is too short" : null,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan.shade500,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.cyan.shade500,
                                        width: 2.0))),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            width: 170,
                            child: RaisedButton(
                              color: Colors.deepOrange.shade600,
                              child: Text(
                                "SIGNIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23.0,
                                    fontFamily: 'Montserrat'),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);

                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = "Invalid Username or Password";
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(58.0),
                              ),
                            ),
                          ),

                          //alternate invalid email error
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            error,
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          )
                        ],
                      ),
                    )))
          ]);
  }
}
