import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as FirebaseCore;
import 'package:image/image.dart';
class Storage {
  final storage = FirebaseStorage.instance;

  Future<String> getPicUrl(Reference picReference) async {
    try {
      var url = await picReference.getDownloadURL();
      // print("THE URL IN PIC IS >>>>>>>>>>>>>>>>>");
      // print(url);
      return url;
    } catch(e) {
      print(e);
      return '';
    }

  }

  Future<void> uploadProfilePic(File file, String uid) async {

    try {
      await storage.ref("users/$uid/profilePic").putFile(file);
    } on FirebaseCore.FirebaseException catch(e) {
      print(e);
    }

  }
}
