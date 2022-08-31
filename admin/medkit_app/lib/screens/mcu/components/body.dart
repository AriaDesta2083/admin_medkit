import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/admin/product/add_product.dart';
import 'package:medkit_app/screens/mcu/components/card_item.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  final mProduct = Get.put(CProduct());
  final Stream<QuerySnapshot> product = FirebaseFirestore.instance
      .collection('product')
      .where('product', isEqualTo: 'Medical Check Up')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: 'Tambah Product',
            press: () {
              mProduct.onRefresh();
              mProduct.product.value = 'Medical Check Up';
              Get.to(() => const ProductAdd());
            },
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: product,
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('Belum Ada Data '),
                );
              } else {
                var myItems = snapshot.data!.docs;
                return Column(
                    children: myItems
                        .map(
                          (item) => CardItem(
                            product: ProductModels(
                                id: item.id.toString(),
                                title: item['title'],
                                product: item['product'],
                                deskripsi: item['deskripsi'],
                                price: item['price'],
                                categories: item['categories'],
                                photoUrl: item['photoUrl'],
                                jamOp: item['jamOp'],
                                active: item['active'],
                                rate: item['rate'],
                                datecreate: item['datecreate'].toString()),
                          ),
                        )
                        .toList());
              }
            }),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
