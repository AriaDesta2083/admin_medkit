import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medkit_app/components/coustom_bottom_nav_bar.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/enums.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/activity/components/detail_activity.dart';
import 'package:medkit_app/size_config.dart';

class ActivityScreen extends StatefulWidget {
  static String routeName = "/activity";

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final auth = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _pesanan = FirebaseFirestore.instance
      .collection('pesanan')
      .orderBy('datecreate', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RS Citra Husada Jember',
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _pesanan,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('Belum ada pesanan'));
            } else {
              var myItems = snapshot.data!.docs;
              return ListView(
                  children: myItems
                      .map(
                        (item) => InkWell(
                          onTap: () => Get.to(
                            () => DetailActivity(
                              product: PesananItem(
                                  id: item.id.toString(),
                                  timepick: item['timepick'],
                                  price: item['price'],
                                  title: item['title'],
                                  product: item['product'],
                                  categories: item['categories'],
                                  imgurl: item['imgurl'],
                                  status: item['status'],
                                  payment: item['payment'],
                                  datepick: item['datepick'],
                                  datecreate: item['datecreate'],
                                  uid: item['uid'],
                                  name: item['name'],
                                  kode: item['kode']),
                            ),
                          ),
                          child: CardItemPesanan(
                            PesananItem(
                                id: item.id.toString(),
                                timepick: item['timepick'],
                                price: item['price'],
                                title: item['title'],
                                product: item['product'],
                                categories: item['categories'],
                                imgurl: item['imgurl'],
                                status: item['status'],
                                payment: item['payment'],
                                datepick: item['datepick'],
                                datecreate: item['datecreate'],
                                uid: item['uid'],
                                name: item['name'],
                                kode: item['kode']),
                          ),
                        ),
                      )
                      .toList());
            }
          },
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.activity),
    );
  }
}

class CardItemPesanan extends StatelessWidget {
  final PesananItem product;
  CardItemPesanan(this.product);
  final StorageProduct storage = StorageProduct();
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(product.datepick);

    String mydate = DateFormat('EEEE, dd MMMM y', 'id').format(date);
    return Card(
      margin: EdgeInsets.all(getProportionateScreenWidth(15)),
      elevation: 1,
      shadowColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Container(
          width: SizeConfig.screenWidth - 80,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionateScreenWidth(123),
                    height: getProportionateScreenWidth(123),
                    child: FutureBuilder(
                        future: storage.downloadURL(product.imgurl),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
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
                                width: getProportionateScreenWidth(120),
                                height: getProportionateScreenWidth(120),
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
                    width: 10,
                  ),
                  Container(
                    width: getProportionateScreenWidth(160),
                    height: getProportionateScreenWidth(120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.title,
                          style: namaStyle.copyWith(
                              color: kPrimaryColor, fontSize: 15),
                          softWrap: true,
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital_rounded,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.product.toString(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              mydate,
                            ),
                          ],
                        ),
                        // Text(product.datecreate.toDate().toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
