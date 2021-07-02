// import 'package:redo/models/user.dart';
// import 'package:redo/services/database.dart';
// import 'package:redo/shared/loading.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class InstaForm extends StatefulWidget {
//   @override
//   _InstaFormState createState() => _InstaFormState();
// }

// class _InstaFormState extends State<InstaForm> {
//   final _formKey = GlobalKey<FormState>();

//   //form values

//   String _currentName;
//   String _currentSelling;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);

//     return StreamBuilder<UserData>(
//         stream: DatabaseService(uid: user.uid).userData,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             UserData userData = snapshot.data;
//             return Form(
//                 key: _formKey,
//                 child: Column(children: <Widget>[
//                   Text(
//                     "Update your profile.",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     initialValue: userData.name,
//                     validator: (val) =>
//                         val.isEmpty ? "Please enter a name" : null,
//                     onChanged: (val) => setState(() => _currentName = val),
//                     decoration: InputDecoration(
//                         labelText: 'My Business Name',
//                         fillColor: Colors.white.withOpacity(0.5),
//                         filled: true,
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.cyan.shade500, width: 2.0)),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.cyan.shade500, width: 2.0))),
//                   ),

//                   //dropdown

//                   //slider
//                   SizedBox(
//                     height: 60,
//                   ),
//                   Container(
//                     height: 50,
//                     width: 170,
//                     child: RaisedButton(
//                         color: Colors.pink,
//                         child: Text(
//                           "Update",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 23.0,
//                               fontFamily: 'Montserrat'),
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(58.0),
//                         ),
//                         onPressed: () async {
//                           if (_formKey.currentState.validate()) {
//                             await DatabaseService(uid: user.uid).updateUserData(
//                                 _currentName ?? userData.name,
//                                 _currentSelling ?? userData.selling);
//                             Navigator.pop(context);
//                           }
//                         }),
//                   )
//                 ]));
//           } else {
//             return Loading();
//           }
//         });
//   }
// }
