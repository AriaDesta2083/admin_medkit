import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/rupiah.dart';
import 'package:medkit_app/size_config.dart';

class DetailActivity extends StatelessWidget {
  final PesananItem product;
  DetailActivity({required this.product});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(product.datepick);
    String mydate = DateFormat('EEEE, dd MMMM y', 'id').format(date);
    final StorageProduct storage = StorageProduct();
    return Stack(children: <Widget>[
      Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: const Color.fromARGB(255, 244, 244, 244),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: SizeConfig.screenHeight / 3,
              width: SizeConfig.screenWidth,
              color: kPrimaryColor,
            ),
            // Spacer(),
            // Image.asset(
            //   "assets/images/splash_1.png",
            //   width: SizeConfig.screenWidth - getProportionateScreenWidth(80),
            // ),
          ],
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Detail Activity'),
        ),
        // bottomNavigationBar:
        //     const CustomBottomNavBar(selectedMenu: MenuState.activity),
        body: SafeArea(
            child: Container(
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10)),
                  width:
                      SizeConfig.screenWidth - getProportionateScreenWidth(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                      boxShadow: shadowBOX),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      ListTile(
                        leading: const Text(
                          'Kode : ',
                          softWrap: true,
                        ),
                        title: Text(product.kode.toString()),
                        subtitle: Text(
                            DateFormat('EEEE, dd MMMM y , HH : mm', 'id')
                                .format(product.datecreate.toDate())),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      )
                    ],
                  ),
                ),
                //! Conten 2
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                  ),
                  width:
                      SizeConfig.screenWidth - getProportionateScreenWidth(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                      boxShadow: shadowBOX),
                  child: Column(
                    children: [
                      const ListTile(
                        tileColor: kPrimaryColor,
                        leading: Icon(
                          Icons.local_hospital_sharp,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                        title: const Text(
                          'RS Citra Husada Jember',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: getProportionateScreenHeight(80),
                              width: getProportionateScreenHeight(80),
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
                                      return Image.network(
                                        snapshot.data!,
                                        fit: BoxFit.cover,
                                      );
                                    }
                                    return const Center(
                                      child: Text('Something Wrong'),
                                    );
                                  }),
                              // child: Image.asset(
                              //   product.imgurl.toString(),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(120),
                              margin: EdgeInsets.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth / 1.6,
                                    child: Text(
                                      product.title,
                                      maxLines: 3,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    'Product : ' + product.product.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    CurrencyFormat.convertToIdr(
                                        product.price, 2),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: kOrange,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ]),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CardText('Name : ', product.name.toString()),
                      CardText('Product : ', product.product.toString()),
                      CardText('Tanggal : ', mydate.toString()),
                      CardText(
                          'Waktu : ', product.timepick.toString() + ' WIB '),
                      if (product.categories.toString() != 'default')
                        CardText('Pelayanan : ', product.categories.toString()),
                      CardText('Pembayaran : ', product.payment.toString()),
                      // PesananItem(
                      //     id: id,
                      //     price: price,
                      //     title: title,
                      //     product: product,
                      //     categories: categories,
                      //     imgurl: imgurl,
                      //     status: status,
                      //     payment: payment,
                      //     datepick: datepick,
                      //     datecreate: datecreate,
                      //     uid: uid,
                      //     name: name,
                      //     kode: kode)
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: getProportionateScreenHeight(100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Note : ',
                                style: Theme.of(context).textTheme.bodyMedium),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              width: SizeConfig.screenWidth -
                                  getProportionateScreenWidth(120),
                              child: Text(
                                  'Harap memperlihatkan halaman ini untuk melakukakan konfirmasi lebih lanjut saat di tempat pelayanan',
                                  softWrap: true,
                                  maxLines: 4,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      )
    ]);
  }
}

class CardText extends StatelessWidget {
  final String label, value;
  CardText(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            this.label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            this.value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500, color: kOrange),
          ),
        ],
      ),
    );
  }
}
