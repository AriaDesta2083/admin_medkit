import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/custom_app_bar.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/mcu/components/details/body.dart';
import 'package:medkit_app/screens/pesan/pesan_screen.dart';

class DetailMCUScreen extends StatelessWidget {
  static String routeName = "/mcudetail";

  @override
  Widget build(BuildContext context) {
    final cPesan = Get.put(CPemesanan());
    final cProduct = Get.put(CProduct());
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rate),
      ),
      body: Body(product: agrs.product),
      bottomNavigationBar: Container(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: agrs.product.active == true ? "ACTIVE" : 'NON ACTIVE',
            press: () {
              //! change data
              cProduct.updateProduct(
                  agrs.product.id, 'active', !agrs.product.active);
              // cPesan.id.value = agrs.product.id.toInt();
              // cPesan.title.value = agrs.product.title.toString();
              // cPesan.price.value = agrs.product.price.toInt();
              // cPesan.imgurl.value = agrs.product.images.toString();
              // Get.to(() => PesanScreen());
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final ProductModels product;

  ProductDetailsArguments({required this.product});
}
