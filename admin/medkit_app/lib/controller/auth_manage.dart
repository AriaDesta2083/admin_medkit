import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthManage extends GetxController {
  CollectionReference profile = FirebaseFirestore.instance.collection('admin');
  CollectionReference imgprofile =
      FirebaseFirestore.instance.collection('imgprofile');

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateUsers(id, namepath, valuepath) async {
    await users
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateProfile(id, namepath, valuepath) async {
    await profile
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateImgProfile(id, namepath, valuepath) async {
    await imgprofile
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}

class CostumerManage extends GetxController {
  CollectionReference profile = FirebaseFirestore.instance.collection('users');
  CollectionReference imgprofile =
      FirebaseFirestore.instance.collection('imgprofile');

  Future<void> updateProfile(id, namepath, valuepath) async {
    await profile
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateImgProfile(id, namepath, valuepath) async {
    await imgprofile
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
