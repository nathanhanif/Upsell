import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection refferance

  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  Future updateUserData(String category, String name, int strength) async {
    return await brewCollection.doc(uid).
    set("name":name,)
  }
}
