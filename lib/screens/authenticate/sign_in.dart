import 'package:redo/screens/authenticate/forgot.dart';
import 'package:redo/services/auth.dart';
import 'package:redo/shared/loading.dart';
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
        :
        // Stack(children: [
        //     (Column(children: [
        //       SizedBox(height: 0.0),
        //       Container(
        //         height: 752.0,
        //         width: 600,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage("images/wave.jpg"),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       )
        //     ])),
        Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.blue.shade600,
              elevation: 0.0,
              title: Text("Login to Easysell"),
            ),
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/wave.jpg"),
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
                            left: 15,
                            top: 65,
                            child: Container(
                              height: 55.0,
                              width: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("images/Upsell logo PNG.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 40,
                          width: 400,
                          padding: EdgeInsets.only(left: 47),
                          child: Text(
                            "WELCOME ",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 40.0),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 400,
                          padding: EdgeInsets.only(left: 79),
                          child: Text(
                            "BACK!",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 40.0),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
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
                          height: 10,
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
                        TextButton(
                          child: Text(
                            "                       Forgot Password?",
                            style: TextStyle(
                                // color: Colors.red,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Future push = Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot()));
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        )
                      ],
                    ),
                  ))
            ]));
  }
}
