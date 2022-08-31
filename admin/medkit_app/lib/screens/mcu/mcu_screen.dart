import 'package:flutter/material.dart';
import 'package:medkit_app/components/coustom_bottom_nav_bar.dart';
import 'package:medkit_app/enums.dart';
import 'package:medkit_app/screens/mcu/components/body.dart';

class MCUScreen extends StatelessWidget {
  static String routeName = "/mcu";
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
