import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/coustom_bottom_nav_bar.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/enums.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/icu/components/body.dart';
import 'package:medkit_app/screens/pesan/pesan_screen.dart';

class ICUScreen extends StatelessWidget {
  static String routeName = "/icu";
  final cpesan = Get.put(CPemesanan());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'RS Citra Husada Jember',
          ),
        ),
        body: Body(),
        bottomNavigationBar: Container(
          color: kWhite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              text: "ACTIVE",
              press: () {
                //! change data

                Get.to(() => PesanScreen());
              },
            ),
          ),
        ));
  }
}
