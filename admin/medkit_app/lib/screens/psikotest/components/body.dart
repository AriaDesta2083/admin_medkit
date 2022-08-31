import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/card_menu.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/psikotest/psikolist.dart';
import 'package:medkit_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CardMenu(
                      text: 'Psikologis Instansi',
                      press: () => Get.to(() => PsikoListScreen(list: 1))),
                  CardMenu(
                      text: 'Psikologis Sekolah',
                      press: () => Get.to(() => PsikoListScreen(list: 2))),
                  CardMenu(
                      text: 'Psikologis Individual',
                      press: () => Get.to(() => PsikoListScreen(list: 3))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/splash_1.png',
                height: getProportionateScreenWidth(210))),
      ]),
    );
  }
}
