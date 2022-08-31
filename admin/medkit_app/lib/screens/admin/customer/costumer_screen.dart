import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/UserModel.dart';
import 'package:medkit_app/screens/admin/customer/costumer_detail.dart';

class CostumerScreen extends StatefulWidget {
  const CostumerScreen({Key? key}) : super(key: key);

  @override
  State<CostumerScreen> createState() => _CostumerScreenState();
}

class _CostumerScreenState extends State<CostumerScreen> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('users').snapshots();
  UsersModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('costumer'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _users,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: kPrimaryColor,
              ));
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('Tidak Ada Data'),
              );
            } else {
              var myItems = snapshot.data!.docs;
              return ListView(
                  children: myItems
                      .map((item) => InkWell(
                            onTap: () {
                              Get.to(CostumerDetail(UsersModel(
                                  uid: item['uid'].toString(),
                                  name: item['name'],
                                  keyName: item['keyName'].toString(),
                                  email: item['email'].toString(),
                                  creationTime: item['creationTime'].toString(),
                                  lastSignInTime:
                                      item['lastSignInTime'].toString(),
                                  photoUrl: item['photoUrl'].toString(),
                                  phoneNumber: item['phoneNumber'].toString(),
                                  address: item['address'].toString(),
                                  status: item['status'],
                                  updatedTime:
                                      item['updatedTime'].toString())));
                            },
                            child: CardCustomer(
                              id: item.id,
                              email: item['email'].toString(),
                              nama: item['name'].toString(),
                              status: item['status'].toString(),
                            ),
                          ))
                      .toList());
            }
          }),
    );
  }
}

class CardCustomer extends StatelessWidget {
  final String id;
  final String nama;
  final String status;
  final String email;
  CardCustomer(
      {required this.nama,
      required this.id,
      required this.status,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: (status.toString().toLowerCase() == 'customer')
            ? Icon(
                Icons.account_box,
                size: 40,
                color: kPrimaryColor,
              )
            : Icon(
                Icons.local_hospital_rounded,
                size: 40,
                color: kPrimaryColor,
              ),
        title: Text(nama),
        subtitle: Text(email),
        trailing: Icon(
          Icons.arrow_right,
          color: kPrimaryColor,
          size: 40,
        ));
  }
}
