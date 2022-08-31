import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/admin/customer/costumer_screen.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            Container(
              margin: EdgeInsets.all(8),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Manage Costumer',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kWhite)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: InkWell(
                onTap: () {
                  Get.to(CostumerScreen());
                },
                child: ListTile(
                  leading: Icon(
                    Icons.supervisor_account,
                    color: kPrimaryColor,
                    size: 50,
                    shadows: shadowBOX,
                  ),
                  title: Text('Costumer'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Manage Product',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kWhite)),
              ),
            ),
            Categories(),
          ],
        ),
      ),
    );
  }
}
