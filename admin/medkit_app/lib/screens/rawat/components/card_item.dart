import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medkit_app/components/default_button.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/rawat/components/details/detail_page.dart';
import 'package:medkit_app/size_config.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.product}) : super(key: key);
  final RawatList product;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(getProportionateScreenWidth(15)),
      elevation: 1,
      shadowColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                product.images[0],
                width: getProportionateScreenWidth(120),
                height: getProportionateScreenWidth(120),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: getProportionateScreenWidth(150),
              height: getProportionateScreenWidth(120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: namaStyle.copyWith(color: kPrimaryColor),
                  ),
                  Row(
                    children: [
                      Text(
                        product.rating.toString(),
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
                    'Stock : ' + product.stock.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () =>
                          //!PUSHH
                          Navigator.pushNamed(
                        context,
                        DetailRawatScreen.routeName,
                        arguments: ProductDetailsArguments(product: product),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        width: getProportionateScreenWidth(80),
                        height: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
