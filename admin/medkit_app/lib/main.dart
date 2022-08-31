import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medkit_app/routes.dart';
import 'package:medkit_app/screens/splash/splash_screen.dart';
import 'package:medkit_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'), // American English
        Locale('id', 'ID'), // Israeli Hebrew
        // ...
      ],
      title: 'Admin Medikal Kit App',
      theme: theme(),
      // home: HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
