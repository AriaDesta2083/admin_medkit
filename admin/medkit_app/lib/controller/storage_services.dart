import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> onUploadImg(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('imgprofile/${fileName.toString()}').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String fileName) async {
    String path = 'imgprofile/' + fileName.toString();
    String downloadUrl = await storage.ref(path).getDownloadURL();

    return downloadUrl;
  }
}

class StorageProduct {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> onUploadImg(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('product/${fileName.toString()}').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String fileName) async {
    String path = 'product/' + fileName.toString();
    String downloadUrl = await storage.ref(path).getDownloadURL();

    return downloadUrl;
  }
}
