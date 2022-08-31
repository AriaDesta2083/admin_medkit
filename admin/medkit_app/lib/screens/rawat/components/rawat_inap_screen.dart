import 'package:flutter/material.dart';
import 'package:medkit_app/screens/rawat/components/card_item.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/size_config.dart';

class RawatInapScreen extends StatelessWidget {
  const RawatInapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rawat Inap'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              listRawat.length,
              (index) {
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                  child: CardItem(product: listRawat[index]),
                ); // here by default width and height is 0
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
