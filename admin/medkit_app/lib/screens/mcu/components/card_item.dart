import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/controller/storage_services.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/mcu/components/details/details_page.dart';

import '../../../size_config.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.product}) : super(key: key);
  final ProductModels product;
  final StorageProduct storage = StorageProduct();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(
              vertical: 5, horizontal: getProportionateScreenWidth(15)),
          elevation: 1,
          shadowColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: kWhite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: getProportionateScreenWidth(123),
                  height: getProportionateScreenWidth(123),
                  child: StreamBuilder(
                      stream: Stream.fromFuture(
                          storage.downloadURL(product.photoUrl[0])),
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
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: getProportionateScreenWidth(170),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: namaStyle.copyWith(color: kPrimaryColor),
                      ),
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
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () =>
                              //!PUSHH
                              Navigator.pushNamed(
                            context,
                            DetailMCUScreen.routeName,
                            arguments:
                                ProductDetailsArguments(product: product),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            width: getProportionateScreenWidth(80),
                            height: getProportionateScreenWidth(30),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(50)),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Text('Active'),
        //       style: ElevatedButton.styleFrom(primary: kPrimaryColor),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Text('Edit'),
        //       style: ElevatedButton.styleFrom(primary: kOrange),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
