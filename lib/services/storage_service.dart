import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as FirebaseCore;
import 'package:image/image.dart';
class Storage {
  final storage = FirebaseStorage.instance;

  Future<void> uploadFile(File file, String fileName) async {

    try {
      await storage.ref("test/$fileName").putFile(file);
    } on FirebaseCore.FirebaseException catch(e) {
      print(e);
    }

  }
}
