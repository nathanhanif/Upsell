import 'package:redo/models/user.dart';
import 'package:redo/services/database.dart';
import 'package:redo/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> selling = [
    "tshirts",
    "jerseys",
    "electronics",
    "jeans",
    "cosmetics",
    "perfumes",
    "food",
    "shambalas",
    "hats",
    "sweets",
    "shoes",
    "chargers",
    "watches",
    "photography services",
    "None",
  ];

  //form values

  String _currentName;
  String _currentSelling;
  String _currentInstagram;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Text(
                    "Update your profile.",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    validator: (val) =>
                        val.isEmpty ? "Please enter a name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                    decoration: InputDecoration(
                        labelText: 'My Business Name',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //dropdown
                  DropdownButtonFormField<String>(
                    value: _currentSelling ?? userData.selling,
                    decoration: InputDecoration(
                        labelText: 'Selling',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0))),
                    items: selling.map((sellings) {
                      return DropdownMenuItem(
                        value: sellings,
                        child: Text("$sellings"),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSelling = val),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    initialValue: userData.instagram,
                    validator: (val) =>
                        val.isEmpty ? "Please enter a name" : null,
                    onChanged: (val) => setState(() => _currentInstagram = val),
                    decoration: InputDecoration(
                        labelText: 'My Instagram Profile Link',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.cyan.shade500, width: 2.0))),
                  ),

                  //slider

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    width: 170,
                    child: RaisedButton(
                        color: Colors.deepOrangeAccent,
                        child: Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 23.0,
                              fontFamily: 'Montserrat'),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(58.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? userData.name,
                              _currentSelling ?? userData.selling,
                              _currentInstagram ?? userData.instagram,
                            );
                            Navigator.pop(context);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "    Paste Your Instagram  Page Link To Start Selling",
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  ),
                ]));
          } else {
            return Loading();
          }
        });
  }
}
