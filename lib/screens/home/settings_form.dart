import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> category = [
    "tshirts",
    "jerseys",
    "electronics",
    "jeans",
    "cosmetics,",
    "perfumes",
    "food",
    "shambalas",
    "caps",
    "sweet,"
  ];

  //form values

  String _currentName;
  String _currentCategory;

  @override
  Widget build(BuildContext context) {
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
            validator: (val) => val.isEmpty ? "Please enter a name" : null,
            onChanged: (val) => setState(() => _currentName = val),
            decoration: InputDecoration(
                hintText: 'My Name',
                fillColor: Colors.white.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.cyan.shade500, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.cyan.shade500, width: 2.0))),
          ),
          SizedBox(
            height: 5,
          ),
          //dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                hintText: 'My Business',
                fillColor: Colors.white.withOpacity(0.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.cyan.shade500, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.cyan.shade500, width: 2.0))),
            items: category.map((categorys) {
              return DropdownMenuItem(
                value: categorys,
                child: Text(
                  "$categorys ",
                ),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentCategory = val),
          ),

          //slider
          SizedBox(
            height: 60,
          ),
          Container(
            height: 50,
            width: 170,
            child: RaisedButton(
                color: Colors.pink,
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
                  print(_currentName);
                  print(_currentCategory);
                }),
          )
        ]));
  }
}
