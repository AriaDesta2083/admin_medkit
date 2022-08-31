import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/auth_manage.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/models/UserModel.dart';
import 'package:medkit_app/size_config.dart';

class DoctorScreen extends StatelessWidget {
  static String routname = '/doctor';
  final Stream<QuerySnapshot> _doctor = FirebaseFirestore.instance
      .collection('users')
      .where('status', isNotEqualTo: 'customer')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: _doctor,
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('Belum ada Docket yang terdaftar'));
              } else {
                var myDoctor = snapshot.data!.docs;
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: myDoctor
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: CardDoctor(
                              user: UsersModel(
                                  uid: item['uid'],
                                  name: item['name'],
                                  keyName: item['keyName'],
                                  email: item['email'],
                                  creationTime: item['creationTime'],
                                  lastSignInTime: item['lastSignInTime'],
                                  photoUrl: item['photoUrl'],
                                  phoneNumber: item['phoneNumber'],
                                  address: item['address'],
                                  status: item['status'],
                                  updatedTime: item['updatedTime'])),
                        ),
                      )
                      .toList(),
                );
              }
            }),
      ),
    );
  }
}

class CardDoctor extends StatelessWidget {
  UsersModel user;
  CardDoctor({required this.user});
  final update = Get.put(AuthManage());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight - 300,
            width: SizeConfig.screenWidth - 40,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: kPrimaryGraColor,
              // image: DecorationImage(
              //   image: NetworkImage(product.img.toString()),
              //   fit: BoxFit.fitHeight,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                user.photoUrl.toString(),
                fit: BoxFit.fitHeight,
                loadingBuilder: loadingCircular,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Hapus Dokter',
                  middleText:
                      'Apakah anda ingin menghapus ${user.name} dari status ${user.status} ',
                  onConfirm: () {
                    update.updateUsers(user.email, 'status', 'customer');
                    Get.back();
                  },
                  confirmTextColor: kWhite,
                  buttonColor: kPrimaryColor,
                  cancelTextColor: kPrimaryColor,
                  onCancel: () {});
            },
            child: const Text('Hapus Dokter'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(SizeConfig.screenWidth - 40, 60),
              primary: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
