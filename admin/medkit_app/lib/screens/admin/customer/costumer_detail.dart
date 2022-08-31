import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/auth_manage.dart';
import 'package:medkit_app/enums.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/UserModel.dart';
import 'package:medkit_app/screens/admin/customer/customer_activity.dart';
import 'package:medkit_app/size_config.dart';
import 'package:medkit_app/theme.dart';

import '../../../components/coustom_bottom_nav_bar.dart';

class CostumerDetail extends StatefulWidget {
  final UsersModel user;
  CostumerDetail(this.user);

  @override
  State<CostumerDetail> createState() => _CostumerDetailState();
}

class _CostumerDetailState extends State<CostumerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Costumer Detail'),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          child: DefaultButton(
            text: "Lihat Pesanan",
            press: () {
              Get.to(ActivityCostumer(widget.user.uid));
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 2.5,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(
                      width: 0.5,
                      color: kWhite,
                    ),
                  ),
                  child: (widget.user.photoUrl.toString() != 'noimage')
                      ? Image.network(
                          widget.user.photoUrl.toString(),
                          filterQuality: FilterQuality.high,
                          loadingBuilder: loadingCircular,
                          fit: BoxFit.fitHeight,
                        )
                      : Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.image_not_supported,
                                size: 100,
                                color: kWhite,
                              ),
                              Text(
                                'NO IMAGE',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: kWhite),
                              )
                            ],
                          ))),
              const SizedBox(
                height: 10,
              ),
              CardCostomerItem(
                icon: Icons.account_circle_rounded,
                path: 'name',
                value: widget.user.name,
                title: 'Nama',
              ),
              CardCostomerItem(
                img: widget.user.photoUrl,
                id: widget.user.email,
                icon: Icons.align_vertical_center_rounded,
                path: 'status',
                value: widget.user.status.toTitleCase(),
                title: 'Status',
              ),
              CardCostomerItem(
                icon: Icons.location_on_rounded,
                path: 'address',
                value: widget.user.address,
                title: 'Alamat',
              ),
              CardCostomerItem(
                icon: Icons.phone,
                path: 'phoneNumber',
                value: widget.user.phoneNumber,
                title: 'Telepon',
              ),
              CardCostomerItem(
                icon: Icons.mail_rounded,
                path: 'email',
                value: widget.user.email,
                title: 'Email',
              ),
              CardCostomerItem(
                icon: Icons.av_timer_rounded,
                path: 'lastSignInTime',
                value: widget.user.lastSignInTime,
                title: 'Terakhir Dilihat',
              ),
            ],
          ),
        ));
  }
}

class CardCostomerItem extends StatefulWidget {
  final String? id, img;
  final IconData icon;
  final String title, value, path;
  CardCostomerItem(
      {this.id,
      this.img,
      required this.title,
      required this.icon,
      required this.path,
      required this.value});

  @override
  State<CardCostomerItem> createState() => _CardCostomerItemState();
}

class _CardCostomerItemState extends State<CardCostomerItem> {
  late bool isUpdate = false;
  String newValue = "";

  final cUpdate = Get.put(CostumerManage());
  TextEditingController valueC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: (isUpdate == true)
            ? Border.all(width: 1, color: kPrimaryColor)
            : null,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  (widget.value != "") ? widget.value : 'Belum ada data',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (widget.path == 'status')
                  const Text('Harap perhatikan status user')
              ],
            ),
            trailing: (widget.path == 'status')
                ? IconButton(
                    onPressed: () {
                      if (widget.img.toString().toLowerCase() != 'noimage') {
                        setState(() {
                          isUpdate = !isUpdate;
                        });
                      } else {
                        Get.defaultDialog(
                            title: 'Data User Tidak Lengkap',
                            middleText:
                                'Mohon lengkapi terlebih dahulu datanya');
                      }
                    },
                    icon: const Icon(Icons.edit))
                : const SizedBox(),
          ),
          if (isUpdate == true && widget.path == 'status')
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: valueC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Status',
                    ).copyWith(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: kPrimaryColor),
                        gapPadding: 10,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: kPrimaryColor),
                        gapPadding: 10,
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        newValue = text;
                        // newValue = valueC.text;
                        //you can access nameController in its scope to get
                        // the value of text entered as shown below
                        //fullName = nameController.text;
                      });
                    },
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          fixedSize: const Size(100, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Get.defaultDialog(
                          buttonColor: kPrimaryColor,
                          confirmTextColor: kWhite,
                          cancelTextColor: kPrimaryColor,
                          title: 'Update User',
                          middleText:
                              'Apakah anda yakin merubah status ${widget.id} dengan actor sebagai ${newValue} ',
                          onConfirm: () {
                            setState(() {
                              cUpdate.updateProfile(
                                  widget.id, widget.path, newValue);
                              Get.back();
                              Get.back();
                            });
                            setState(() {});
                          },
                          onCancel: () {
                            setState(() {
                              isUpdate = false;
                            });
                          },
                        );
                      },
                      child: const Text('confirm')),
                ],
              ),
            )
        ],
      ),
    );
  }
}
