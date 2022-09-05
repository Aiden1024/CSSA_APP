import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_profile.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  // Collection Reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String email, String username, {String pic='', String bio = '这里什么都没有哦~'} ) async {
    return await userCollection.doc(uid).set({
      'profilePic' : pic,
      'email' : email,
      'username' : username,
      'formalName' : 'FIRST LAST',
      'department' : [],
      'bio' : bio,
      'post': []

    });
  }

  Future getUserData()  async {
    String username;
    String formalName;
    String bio;
    List<String> departments;
    String pic;
    List<String> post;

    var target_user = await userCollection.doc(uid);
    target_user.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
      username = data['username'];
      formalName = data['formalName'];
      bio = data['bio'];
      departments = (data['departments'] ?? []).cast<String>().toList();
      pic = data['pic'];
      post = (data['post'] ?? []).cast<String>().toList();
      var up = userProfile(username: username, formalName: formalName, bio: bio, post:post, departments: departments, pic: pic);
      return up;
      }, onError: (e) => debugPrint('error getting doc $e'),
    );




  }

}