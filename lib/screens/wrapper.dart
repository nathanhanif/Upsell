// import 'package:redo/layout/bod.dart';
import 'package:redo/layout/bod.dart';
import 'package:redo/layout/carousel.dart';
import 'package:redo/models/user.dart';
import 'package:redo/screens/authenticate/register.dart';
import 'package:redo/screens/dialog.dart';
import 'package:redo/screens/loginorsignup/loginsignup.dart';
import 'package:redo/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or auth

    if (user == null) {
      return LoginSignup();
    } else {
      return Bod();
    }
  }
}
