import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String userName;
  String userEmail;
  String userImageURL;

  User({
    this.userName,
    this.userEmail,
    this.userImageURL,
  });

  User.fromJson(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.userName = snapshot.data['name'];
    this.userEmail = snapshot.data['email'];
    this.userImageURL = snapshot.data['imageURL'];
  }
  toJson() {
    return {
      'name': this.userName,
      'email': this.userEmail,
      'imageURL': this.userImageURL,
    };
  }
}
