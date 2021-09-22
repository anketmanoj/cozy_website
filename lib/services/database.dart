import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData({String name, String phoneNo, String email}) async {
    try {
      return await userCollection.doc(uid).set({
        'id': uid,
        'name': name,
        'phoneNo': phoneNo,
        'email': email,
      });
    } catch (e) {
      print("Error ==== ${e.toString()}");
      return null;
    }
  }

  // get user stream
  Stream<DocumentSnapshot> get users {
    return userCollection.doc(uid).snapshots();
  }
}
