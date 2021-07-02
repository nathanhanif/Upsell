import 'package:redo/screens/authenticate/forgot.dart';
import 'package:redo/services/auth.dart';
import 'package:redo/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  Future<void> _launched;
  String phoneNumber = "";

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldnt Open Dailer";
    }
  }

  TextEditingController _controller = new TextEditingController();

  //text feild state

  String email = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.blue.shade600,
                  elevation: 0.0,
                  title: Text("Reset Password"),
                ),
                body: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/trouble.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Positioned(
                                left: 15,
                                top: 55,
                                child: Container(
                                  height: 55.0,
                                  width: 190,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/Upsell logo PNG.png"),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 0,
                            ),

                            Container(
                              height: 40,
                              width: 400,
                              padding: EdgeInsets.only(left: 55),
                              child: Text(
                                "FORGOT ",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 40.0),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 400,
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                "PASSWORD?",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 40.0),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Enter Your Email Address',
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
                                  return "Enter Your Email";
                                }
                                if (!RegExp(
                                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                    .hasMatch(val)) {
                                  return 'Email Address Not Valid';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // TextFormField(
                            //   validator: (val) =>
                            //       val.length < 8 ? "Password is too short" : null,
                            //   decoration: InputDecoration(
                            //       hintText: 'Password',
                            //       fillColor: Colors.white.withOpacity(0.5),
                            //       filled: true,
                            //       enabledBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               color: Colors.cyan.shade500,
                            //               width: 2.0)),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               color: Colors.cyan.shade500,
                            //               width: 2.0))),
                            //   obscureText: true,
                            //   onChanged: (val) {
                            //     setState(() => password = val);
                            //   },
                            // ),

                            SizedBox(
                              height: 25,
                            ),

                            Builder(
                              builder: (context) => RaisedButton(
                                  color: Colors.deepOrange.shade600,
                                  child: Text(
                                    "Get Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  //       onPressed: () async {
                                  //         if (_formKey.currentState.validate()) {
                                  //           setState(() {
                                  //             _controller.clear();
                                  //           });
                                  //           Scaffold.of(context).showSnackBar(SnackBar(
                                  //             content: Text(
                                  //               "A password was sent to the Email you provided",
                                  //               style: TextStyle(
                                  //                 // backgroundColor:
                                  //                 //     Colors.deepOrangeAccent,
                                  //                 color: Colors.white,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 fontSize: 20.0,
                                  //                 // fontFamily: 'Montserrat'
                                  //               ),
                                  //             ),
                                  //           ));

                                  //           //setState(() => loading = true);

                                  //           dynamic result = (email);
                                  //           if (result == null) {
                                  //             setState(() {
                                  //               error = "Invalid Username or Password";
                                  //               // loading = false;
                                  //               _auth.sendPasswordResetEmail(email);
                                  //             });
                                  //           }
                                  //           //   Scaffold.of(context).showSnackBar(SnackBar(
                                  //           //     content: Text("hgdsf"),
                                  //           //   ));
                                  //           // },
                                  //         }
                                  //       },
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(58.0),
                                  //       )),
                                  // ),

                                  // Container(
                                  //   height: 50,
                                  //   width: 190,
                                  //   child: RaisedButton(
                                  //       color: Colors.deepOrange.shade600,
                                  //       child: Text(
                                  //         "Get Password",
                                  //         style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontWeight: FontWeight.w500,
                                  //             fontSize: 20.0,
                                  //             fontFamily: 'Montserrat'),
                                  //       ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      // setState(() => loading = true);

                                      // loading = false;
                                      _auth.sendPasswordResetEmail(email);

                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "A password was sent to the Email you provided",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ));

                                      dynamic result = (email);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              "Invalid Username or Password";
                                        });
                                      }

                                      ;

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(58.0),
                                      );
                                    }
                                  }),
                            ),

                            //alternate invalid email error
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Montserrat'),
                            ),

                            Text(
                              " Can't Retrieve Password?",
                              style: TextStyle(
                                  // color: Colors.red,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),

                            RaisedButton(
                              elevation: 0,
                              color: Colors.transparent
                              //.withOpacity(0)
                              ,
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  _launched =
                                      _makePhoneCall("tel: +254705013411");
                                });
                              },
                            ),
                          ],
                        ),
                      ))
                ])),
          );
  }
}
