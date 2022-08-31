import 'package:flutter/widgets.dart';
import 'package:medkit_app/controller/wrapper.dart';
import 'package:medkit_app/screens/activity/activity_screen.dart';
import 'package:medkit_app/screens/admin/product/edit_product.dart';
import 'package:medkit_app/screens/details/details_screen.dart';
import 'package:medkit_app/screens/home/home_screen.dart';
import 'package:medkit_app/screens/login_success/login_success_screen.dart';
import 'package:medkit_app/screens/mcu/components/details/details_page.dart';
import 'package:medkit_app/screens/pembayaran/pembayaran_screen.dart';
import 'package:medkit_app/screens/profile/profile_screen.dart';
import 'package:medkit_app/screens/psikotest/components/details/detail_page.dart';
import 'package:medkit_app/screens/psikotest/psikotest_screen.dart';
import 'package:medkit_app/screens/rawat/components/details/detail_page.dart';
import 'package:medkit_app/screens/rawat/rawat_screen.dart';
import 'package:medkit_app/screens/sign_in/sign_in_screen.dart';
import 'package:medkit_app/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Wrapper.routeName: ((context) => Wrapper()),
  SignInScreen.routeName: (context) => SignInScreen(),
  RawatScreen.routeName: (context) => RawatScreen(),
  PsikotestScreen.routeName: (context) => PsikotestScreen(),
  DetailRawatScreen.routeName: (context) => DetailRawatScreen(),
  DetailMCUScreen.routeName: (context) => DetailMCUScreen(),
  DetailPsikoScreen.routeName: (context) => DetailPsikoScreen(),
  PembayaranScreen.routeName: (context) => PembayaranScreen(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ActivityScreen.routeName: (context) => ActivityScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
