import 'package:redo/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:redo/services/auth.dart';

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
        : Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.blue.shade600,
              elevation: 0.0,
              title: Text("Signup to Easysell"),
            ),
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/woman.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Positioned(
                            left: 16,
                            top: 55,
                            child: Container(
                              height: 55.0,
                              width: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/Upsell logo PNG.png"),
                                    fit: BoxFit.fitHeight),
                              ),
                            )),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          height: 38,
                          width: 400,
                          padding: EdgeInsets.only(left: 43),
                          child: Text(
                            "WELCOME ",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 40.0),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 400,
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "ABOARD!",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 40.0),
                          ),
                        ),

                        SizedBox(
                          height: 10,
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
                                      color: Colors.cyan.shade500, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan.shade500,
                                      width: 2.0))),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
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
                                      color: Colors.cyan.shade500, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan.shade500,
                                      width: 2.0))),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),

                        SizedBox(height: 15),
                        Container(
                            child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Confirm Your Password";
                            } else if (value != password) {
                              return "Password Do Not Match";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              fillColor: Colors.white.withOpacity(0),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan.shade500, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan.shade500,
                                      width: 2.0))),
                          obscureText: true,
                        )),
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
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
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
                  ))
            ]));
  }
}
