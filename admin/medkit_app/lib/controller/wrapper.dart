import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medkit_app/controller/auth_services.dart';
import 'package:medkit_app/screens/home/home_screen.dart';
import 'package:medkit_app/screens/sign_in/sign_in_screen.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return SignInScreen();
        });
  }
}
