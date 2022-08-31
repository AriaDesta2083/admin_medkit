import 'package:flutter/material.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductImages extends StatefulWidget {
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(275),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: 1,
              child: Image.asset(
                'assets/images/ICU.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        Container(
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Intensive Care Unit',
                style: namaStyle,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   'STOCK : 4',
          //   style: Theme.of(context).textTheme.headline6,
          // ),
          Text(
            '''Rumah Sakit Citra Husada memiliki ruang ICU dengan kapasitas 4 tempat tidur dengan peralatan khusus yang dilengkapi tenaga perawat yang terampil dan dokter jaga 24 jam. 

Fasilitas medis yang tersedia di ICU sebagai berikut :
1. Syring Pump
2. ECG
3. Patient Monitor
4. Suction Pump
5. Nebulizer
6. Ventilator
7. DC-Shock''',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 10,
          )
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
