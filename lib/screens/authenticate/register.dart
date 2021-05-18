import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Stack(children: [
            (Column(children: [
              SizedBox(height: 60.0),
              Container(
                height: 692.0,
                width: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/woman.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ])),
            Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomPadding: false,
                appBar: AppBar(
                  backgroundColor: Colors.blue.shade800,
                  elevation: 0.0,
                  title: Text("Signup to Upsell"),
                ),
                body: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Positioned(
                              left: 16,
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
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: 400,
                            padding: EdgeInsets.only(left: 17),
                            child: Text(
                              "WELCOME ",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 50.0),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 400,
                            padding: EdgeInsets.only(left: 34),
                            child: Text(
                              "ABOARD!",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 50.0),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
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
                            height: 20,
                          ),
                          Container(
                            height: 52,
                            width: 155,
                            child: RaisedButton(
                                color: Colors.deepOrange.shade600,
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23.0,
                                      fontFamily: 'Montserrat'),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);

                                    if (result == null) {
                                      setState(() {
                                        error = "please supply valid email";
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(58))),
                          ),

                          //alternate invalid email error
                          //SizedBox(height: 12,),
                          //Text(error,
                          //style: TextStyle(color: Colors.red, fontSize: 14.0),)
                        ],
                      ),
                    )))
          ]);
  }
}
