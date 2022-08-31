import 'package:flutter/material.dart';
import 'package:medkit_app/screens/splash/components/body.dart';
import 'package:medkit_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   final authC = Get.put(AuthControl(), permanent: true);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: authC.streamAuthStatus,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             return GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Medikal Kit App',
//               theme: theme(),
//               // home: HomeScreen(),
//               initialRoute: snapshot.data == null
//                   ? SplashScreen.routeName
//                   : HomeScreen.routeName,
//               routes: routes,
//             );
//           }
//           return SplashScreen();
//         });
//   }
// }
