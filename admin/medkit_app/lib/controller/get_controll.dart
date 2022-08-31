import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:get/get.dart';

class CPayment extends GetxController {
  var payment = 'Pilih Metode Pembayaran'.obs;
  void changePayment(String newPayment) {
    payment.value = newPayment;
    print(payment.value.toString());
  }
}

class CPemesanan extends GetxController {
  final auth = FirebaseAuth.instance.currentUser;
  CollectionReference pesanan =
      FirebaseFirestore.instance.collection('pesanan');

  var id = 0.obs;
  var title = 'default'.obs;
  var price = 0.obs;
  var categories = 'default'.obs;
  var imgurl = 'default'.obs;
  var status = 'default'.obs;
  var payment = 'default'.obs;
  var datepick = 'default'.obs;
  var datecreate = 'default'.obs;
  var uid = 'default'.obs;
  var name = 'default'.obs;
  var kode = 'default'.obs;

  void onCekPesan() {
    kode.value = id.value.toString().randomItem() +
        title.value.toString().randomItem() +
        price.value.toString().randomItem() +
        categories.value.toString().randomItem() +
        imgurl.value.toString()[1] +
        status.value.toString().randomItem() +
        payment.value.toString().randomItem() +
        datepick.value.toString().substring(6).randomItem() +
        datecreate.value.toString().substring(6).randomItem() +
        uid.value.toString().randomItem() +
        name.value.toString().randomItem();
    print('DATA UPDATE \n \n ' +
        id.value.toString() +
        '\n' +
        title.value.toString() +
        '\n' +
        price.value.toString() +
        '\n' +
        categories.value.toString() +
        '\n' +
        imgurl.value.toString() +
        '\n' +
        status.value.toString() +
        '\n' +
        payment.value.toString() +
        '\n' +
        datepick.value.toString() +
        '\n' +
        datecreate.value.toString() +
        '\n' +
        uid.value.toString() +
        '\n' +
        name.value.toString() +
        '\n' +
        kode.value.toString().toUpperCase());
  }

  Future<void> onPemesanan() async {
    await pesanan
        .add({
          'id': id.toInt(),
          'title': title.toString(),
          'price': price.toInt(),
          'categories': categories.toString(),
          'imgurl': imgurl.toString(),
          'payment': payment.toString(),
          'status': status.toString(),
          'datepick': datepick.toString(),
          'datecreate': datecreate.toString(),
          'uid': uid.toString(),
          'name': name.toString(),
          'kode': kode.toString().toUpperCase()
        })
        .then((value) => print('Pesanan updated'))
        .catchError((error) => print('Failed to add : $error'));
  }

  Future<void> updatePesanan(id, namepath, valuepath) async {
    await pesanan
        .doc(id)
        .update({namepath: valuepath})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to delete: $error"));
  }

  Future<void> deletePesanan(id, namepath, valuepath) async {
    await pesanan
        .doc(id)
        .delete()
        .then((value) => print("Pesanan del"))
        .catchError((error) => print("Failed to delete: $error"));
  }
}
