import 'package:redo/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redo/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String name, String selling, String instagram) async {
    Map<String, String> data = {
      'name': name,
      'selling': selling,
      'instagram': instagram,
    };

    return await brewCollection.document(uid).setData(data);
  }

  //brew list from snapshot
  List<Brew> _brewlistfromsnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data["name"].toString() ?? "",
        selling: doc.data["selling"].toString() ?? "",
        instagram: doc.data["instagram"].toString() ?? "",
      );
    }).toList();
  }

//userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data["name"].toString(),
      selling: snapshot.data["selling"].toString(),
      instagram: snapshot.data["instagram"].toString(),
    );
  }

//get brews stream

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewlistfromsnapShot);
  }

//get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
