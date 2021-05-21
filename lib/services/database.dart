import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  Future updateUserData(String name, String category) async {
    Map<String, String> data = {
      'name': name,
      'category': category,
    };

    return await brewCollection.document(uid).setData(data);
  }

  //brew list from snapshot
  List<Brew> _brewlistfromsnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data["name"].toString() ?? "",
        category: doc.data["category"].toString() ?? "",
      );
    }).toList();
  }

//get brews stream

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewlistfromsnapShot);
  }
}
