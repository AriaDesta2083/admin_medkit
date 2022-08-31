import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medkit_app/controller/get_admin.dart';
import 'package:medkit_app/screens/doctor/doctor_screen.dart';
import 'package:medkit_app/screens/icu/icu_screen.dart';
import 'package:medkit_app/screens/mcu/mcu_screen.dart';
import 'package:medkit_app/screens/psikotest/psikotest_screen.dart';
import 'package:medkit_app/screens/rawat/rawat_screen.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cProduct = Get.put(CProduct());

    final List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/ic_doctor.svg",
        "text": "Doctor",
        "press": DoctorScreen()
      },
      {
        "icon": "assets/icons/ic_dnatest.svg",
        "text": "Psikolog Test",
        "press": PsikotestScreen()
      },
      {
        "icon": "assets/icons/ic_labtest.svg",
        "text": "Medical Check Up",
        "press": MCUScreen()
      },
      {
        "icon": "assets/icons/ic_dropper.svg",
        "text": "Intensive Care Unit  ",
        'press': ICUScreen()
      },
      {"icon": "assets/icons/ic_vaksin.svg", "text": "Vaksin"},
      {
        "icon": "assets/icons/ic_pill.svg",
        "text": "Rawat",
        "press": RawatScreen()
      },
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              if (categories[index]["text"] == "Vaksin") {
                cProduct.pushDataAwal();
              } else {
                cProduct.onReload();

                Get.to(categories[index]["press"]);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(57, 121, 121, 121),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  icon!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
