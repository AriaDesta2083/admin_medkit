import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/custom_app_bar.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/admin/product/edit_product.dart';
import 'package:medkit_app/screens/psikotest/components/details/body.dart';
import 'package:medkit_app/size_config.dart';

class DetailPsikoScreen extends StatelessWidget {
  static String routeName = "/psikodetail";

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
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(SizeConfig.screenWidth / 2 - 30, 50),
                            primary: kOrange),
                        onPressed: () {
                          Get.to(ProductEdit(product: agrs.product));
                        },
                        child: SizedBox(
                          width: SizeConfig.screenWidth / 2 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kWhite),
                              ),
                              const Icon(
                                Icons.edit,
                                color: kWhite,
                              )
                            ],
                          ),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(SizeConfig.screenWidth / 2 - 30, 50),
                            primary: kPrimaryColor),
                        onPressed: () {
                          Get.defaultDialog(
                              confirmTextColor: kWhite,
                              buttonColor: kPrimaryColor,
                              cancelTextColor: kPrimaryColor,
                              title: 'Delete Data',
                              middleText: "Yakin menghapus product \n'' " +
                                  agrs.product.title +
                                  " '' ? ",
                              onCancel: () {},
                              onConfirm: () {
                                cProduct.deleteProduct(
                                  agrs.product.id,
                                );
                                Get.back();
                                Get.back();
                              });
                        },
                        child: SizedBox(
                          width: SizeConfig.screenWidth / 2 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delete',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kWhite),
                              ),
                              const Icon(
                                Icons.delete,
                                color: kWhite,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultButton(
                  text: agrs.product.active == true ? "ACTIVE" : "NON ACTIVE",
                  press: () {
                    // //! change data
                    cProduct.updateProduct(
                        agrs.product.id, 'active', !agrs.product.active);

                    // cPesan.id.value = agrs.product.id.toInt();
                    // cPesan.title.value = agrs.product.title.toString();
                    // //* memilih pesanan
                    // // cPesan.price.value = agrs.product.price[1].toInt();
                    // cPesan.imgurl.value = agrs.product.images.toString();
                    Get.back();
                  },
                ),
              ],
            ),
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
