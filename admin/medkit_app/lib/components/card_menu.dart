import 'package:flutter/material.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/size_config.dart';

class CardMenu extends StatelessWidget {
  CardMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        alignment: Alignment.center,
        width: getProportionateScreenWidth(375 - 40),
        height: getProportionateScreenHeight(812 / 7),
        decoration: BoxDecoration(
            gradient: kPrimaryGraColor,
            boxShadow: shadowBOX,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
