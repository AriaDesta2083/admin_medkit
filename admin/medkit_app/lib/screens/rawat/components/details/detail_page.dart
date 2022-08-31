import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/components/custom_app_bar.dart';
import 'package:medkit_app/screens/pesan/pesan_screen.dart';
import 'package:medkit_app/screens/rawat/components/details/body.dart';
import 'package:medkit_app/size_config.dart';

class DetailRawatScreen extends StatelessWidget {
  static String routeName = "/rawatdetail";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    final cPesan = Get.put(CPemesanan());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(product: agrs.product),
      bottomNavigationBar: Container(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: "ACTIVE",
            press: () {
              //! change data
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final RawatList product;

  ProductDetailsArguments({required this.product});
}
