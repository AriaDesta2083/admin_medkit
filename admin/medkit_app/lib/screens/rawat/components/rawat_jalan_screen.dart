import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/card_menu.dart';
import 'package:medkit_app/components/custom_app_bar.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/get_controll.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/rupiah.dart';
import 'package:medkit_app/screens/complete_profile/components/body.dart';
import 'package:medkit_app/screens/pesan/pesan_screen.dart';
import 'package:medkit_app/screens/rawat/components/card_item.dart';
import 'package:medkit_app/size_config.dart';

class RawatJalanScreen extends StatelessWidget {
  final Stream<QuerySnapshot> product = FirebaseFirestore.instance
      .collection('product')
      .where('title', isEqualTo: 'Instalasi Rawat Jalan')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(rating: 4.8),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: 'ACTIVE',
            press: () {
              // Get.to(PesanScreen());
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: product,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var myItems = snapshot.data!.docs;
                return ListView(
                    children: myItems.map((item) {
                  return Body(
                    product: ProductModels(
                        id: item.id.toString(),
                        title: item['title'],
                        product: item['product'],
                        deskripsi: item['deskripsi'],
                        price: item['price'],
                        categories: item['categories'],
                        photoUrl: item['photoUrl'],
                        datecreate: item['datecreate'],
                        jamOp: item['jamOp'],
                        active: item['active'],
                        rate: item['rate']),
                  );
                }).toList());
              } else if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('Maaf laynan tidak tersedia'));
              } else {
                return const Center(child: Text('Something Wrong'));
              }
            }));
  }
}

class Body extends StatefulWidget {
  final ProductModels product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModels product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final StorageProduct storage = StorageProduct();

  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: getProportionateScreenHeight(275),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.title.toString(),
              child: FutureBuilder(
                  future: storage
                      .downloadURL(widget.product.photoUrl[selectedImage]),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
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
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(5)),
        Container(
          width: SizeConfig.screenWidth,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.product.title.toString(),
              style: namaStyle,
            ),
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(2),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadowBOX,
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            widget.product.photoUrl[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModels product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int? myselected = 0;

  @override
  Widget build(BuildContext context) {
    final cPesan = Get.find<CPemesanan>();
    cPesan.imgurl.value = widget.product.photoUrl[0];
    cPesan.title.value = widget.product.title;
    cPesan.price.value = widget.product.price[myselected!];
    cPesan.categories.value = widget.product.categories[myselected!].toString();
    print(cPesan.categories.value.toString() + cPesan.price.value.toString());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            ' Pilih Poli Rawat Jalan  : ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(SizeConfig.screenWidth / 1.2, 50),
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Pilih Poli",
                        content: Container(
                          height: SizeConfig.screenHeight / 3,
                          width: SizeConfig.screenWidth - 80,
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              ...List.generate(
                                widget.product.categories.length,
                                ((index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          myselected = index;
                                          Get.back();
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(6),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: kWhite,
                                              border: Border.all(
                                                  width: 1,
                                                  color: kPrimaryColor),
                                              boxShadow: shadowBOX,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            widget.product.categories[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(color: kOrange),
                                          )),
                                    )),
                              )
                            ],
                          )),
                        ));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.product.categories[myselected!]),
                        Icon(Icons.local_hospital)
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Harga : ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                CurrencyFormat.convertToIdr(
                    widget.product.price[myselected!], 2),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(widget.product.deskripsi),

          // Text(
          //   widget.product.deskripsi.toString(),
          //   style: Theme.of(context).textTheme.bodyLarge,
          // ),
        ],
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        boxShadow: shadowBOXtop,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
