import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/loginorsignup/loginsignup.dart';
import 'package:brew_crew/screens/home/home.dart';
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
      return Home();
    }
  }
}
