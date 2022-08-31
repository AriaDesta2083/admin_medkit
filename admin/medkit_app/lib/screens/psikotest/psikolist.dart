import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/admin/product/add_product.dart';
import 'package:medkit_app/screens/psikotest/components/details/detail_page.dart';
import 'package:medkit_app/size_config.dart';

class PsikoListScreen extends StatefulWidget {
  static String routeName = 'psikolist';
  final int list;
  const PsikoListScreen({Key? key, required this.list}) : super(key: key);

  @override
  State<PsikoListScreen> createState() => _PsikoListScreenState();
}

class _PsikoListScreenState extends State<PsikoListScreen> {
  final cProduct = Get.put(CProduct());
  @override
  Widget build(BuildContext context) {
    if (widget.list == 1) {
      cProduct.product.value = "Psikologis Instansi";
    } else if (widget.list == 2) {
      cProduct.product.value = "Psikologis Sekolah";
    } else if (widget.list == 3) {
      cProduct.product.value = "Psikologis Individu";
    }
    // final Stream<QuerySnapshot> product = FirebaseFirestore.instance
    //     .collection('product')
    //     .where('title', isEqualTo: cProduct.product.value)
    //     .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RS Citra Husada Jember',
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: 'Tambah Product',
            press: () {
              cProduct.onRefresh();

              Get.to(() => ProductAdd());
            },
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('product')
                .where('product', isEqualTo: cProduct.product.value.toString())
                .snapshots(),
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
                List wadah = myItems;
                for (var i = 0; i < wadah.length; i++) {
                  print(wadah[i]);
                }
                return Column(
                    children: myItems
                        .map((item) => CardItem(
                              product: ProductModels(
                                  datecreate: item['datecreate'].toString(),
                                  id: item.id.toString(),
                                  title: item['title'],
                                  product: item['product'],
                                  deskripsi: item['deskripsi'],
                                  price: item['price'],
                                  categories: item['categories'],
                                  photoUrl: item['photoUrl'],
                                  jamOp: item['jamOp'],
                                  active: item['active'],
                                  rate: item['rate']),
                            ))
                        .toList());
              }
            }),
      ]),
    );
  }
}

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.product}) : super(key: key);
  final ProductModels product;
  final StorageProduct storage = StorageProduct();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(getProportionateScreenWidth(15)),
      elevation: 1,
      shadowColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: getProportionateScreenWidth(305),
              height: getProportionateScreenWidth(205),
              child: StreamBuilder(
                  stream: Stream.fromFuture(
                      storage.downloadURL(product.photoUrl[0])),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kOrange,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          snapshot.data!,
                          width: getProportionateScreenWidth(300),
                          height: getProportionateScreenWidth(200),
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return const Center(
                      child: Text('Something Wrong'),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: getProportionateScreenWidth(310),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toString(),
                    style: namaStyle.copyWith(color: kPrimaryColor),
                  ),
                  const SizedBox(width: 5),
                  // Text(
                  //   // CurrencyFormat.convertToIdr(product.price[0], 2).toString(),
                  //   'Jadwal : ' + product.time,
                  //   style: Theme.of(context).textTheme.bodyLarge,
                  // ),
                  Row(
                    children: [
                      Text(
                        product.rate.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                  Text(
                    product.active == true
                        ? 'Status : Active'
                        : 'Status : Non Active',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () =>
                          //!PUSHH
                          Navigator.pushNamed(
                        context,
                        DetailPsikoScreen.routeName,
                        arguments: ProductDetailsArguments(product: product),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        width: getProportionateScreenWidth(80),
                        height: getProportionateScreenWidth(35),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Detail',
                              style: TextStyle(fontSize: 15, color: kWhite),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: kWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
