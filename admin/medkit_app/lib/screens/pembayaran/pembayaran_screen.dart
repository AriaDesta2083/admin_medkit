import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/pembayaran/components/body.dart';

class PembayaranScreen extends StatelessWidget {
  static String routeName = "/pembayaran";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RS Citra Husada Jember',
        ),
      ),
      body: Body(),
    );
  }
}
