import 'dart:ffi';

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
      'pic' : pic,
      'email' : email,
      'username' : username,
      'formalName' : 'FIRST LAST',
      'departments' : [],
      'bio' : bio,
      'post': [],
      'depHead':  false

    });
  }

  Future<UserProfile> getUserData()  async {
    UserProfile up;
    String username;
    String formalName;
    String bio;
    List<int> departments;
    String pic;
    List<String> post;

    var targetUser = userCollection.doc(uid);
    DocumentSnapshot doc = await targetUser.get();
    final data = doc.data() as Map<String, dynamic>;
    // print('INSIDE GET USER');
    // print(data);
    username = data['username'] ?? "error in username";
    formalName = data['formalName'] ?? "error in formalName";
    bio = data['bio'] ?? "error in bio";
    departments = (data['departments'] ?? []).cast<int>().toList();
    pic = data['pic'] ?? "error in pic";
    post = (data['post'] ?? []).cast<String>().toList();
    up = UserProfile(username: username, formalName: formalName, bio: bio, post:post, departments: departments, pic: pic);
    return up;

  }

  UserProfile _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile(username: snapshot.get('username'),
        formalName: snapshot.get('formalName'),
        pic: snapshot.get('pic'),
        bio: snapshot.get('bio'),
        post: snapshot.get('post'),
        departments: snapshot.get('departments'));
  }

  // get user doc stream
  Stream<UserProfile> get userData {
    // applies snapshot from stream, each snapshot being pass into _userDataFromSnapshot
    print("DEBUG");
    print("uid $uid");
    print(userCollection.doc(uid).snapshots());
    var re = userCollection.doc(uid).snapshots().map<UserProfile>(_userDataFromSnapshot);
    return re;
  }

  List<UserProfile> _uPListFromSnapshot(QuerySnapshot snapshot) {
    print("DEBUG in _uPList");
    print(snapshot);
    return snapshot.docs.map((doc) {
      return UserProfile(username: doc.get("username"),
          formalName: doc.get("formalName") ?? "error",
          pic: doc.get("pic") ?? "error",
          bio: doc.get("bio") ?? "error",
          post: (doc.get("post") ?? []).cast<String>().toList(),
          departments: (doc.get("departments")?? []).cast<int>().toList());
    }).toList();
  }

  // GetUP Stream
Stream<List<UserProfile>> get userProfiles {
    return userCollection.snapshots().map(_uPListFromSnapshot);
}

}