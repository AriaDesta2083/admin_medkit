import 'package:flutter/material.dart';
import 'package:medkit_app/components/coustom_bottom_nav_bar.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/pesan/components/body.dart';

class PesanScreen extends StatelessWidget {
  static String routeName = "/pesan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KONFIRMASI PESANAN',
        ),
      ),
      body: Body(),
      // bottomNavigationBar: Container(
      //   color: kWhite,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: DefaultButton(
      //       text: "CONFIRM",
      //       press: () {},
      //     ),
      //   ),
      // ),
    );
  }
}
