import 'package:flutter/material.dart';
import 'package:medkit_app/components/coustom_bottom_nav_bar.dart';
import 'package:medkit_app/models/Product.dart';
import 'package:medkit_app/screens/psikotest/components/body.dart';

import '../../enums.dart';

class PsikotestScreen extends StatelessWidget {
  static String routeName = "/psikotest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RS Citra Husada Jember',
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
