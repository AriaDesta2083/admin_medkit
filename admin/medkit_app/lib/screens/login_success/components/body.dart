import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/wrapper.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/routes.dart';
import 'package:medkit_app/screens/home/home_screen.dart';
import 'package:medkit_app/screens/login_success/login_success_screen.dart';
import 'package:medkit_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: kPrimaryGradientColor),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.4,
              child: SvgPicture.asset('assets/icons/ic_doctor.svg'), //40%
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              "Login Success",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(57, 121, 121, 121),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "Back to home",
                press: () {
                  Get.offAll(Wrapper());
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
