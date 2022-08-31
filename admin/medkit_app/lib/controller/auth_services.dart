import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medkit_app/controller/wrapper.dart';
import 'package:medkit_app/item_constant.dart';
import 'package:medkit_app/screens/sign_in/sign_in_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void signin(String email, String pw) async {
    int emaillength = email.length;
    var cekemail = email.substring(emaillength - 12, emaillength).toString();
    if (cekemail == 'citra.husada') {
      print(cekemail);
      try {
        UserCredential myUser =
            await auth.signInWithEmailAndPassword(email: email, password: pw);
        Get.offAllNamed(Wrapper.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.defaultDialog(
              title: 'Login Gagal', middleText: 'User Tidak Ditemukan');
        } else if (e.code == 'wrong-password') {
          Get.defaultDialog(title: 'Login Gagal', middleText: 'Password Salah');
        }
      }
    } else {
      Get.defaultDialog(title: 'Login Gagal', middleText: 'Anda Bukan Admin');
    }
  }

  // void signup(String email, String kpw) async {
  //   try {
  //     UserCredential myUser = await auth.createUserWithEmailAndPassword(
  //         email: email, password: kpw);
  //     await myUser.user!.sendEmailVerification();
  //     Get.defaultDialog(
  //         buttonColor: kPrimaryColor,
  //         confirmTextColor: kWhite,
  //         title: 'Verification E-mail',
  //         middleText:
  //             "Kami telah mengirimkan email verifikasi. Silahkan cek $email anda dan lakukan verifikasi.",
  //         onConfirm: () {
  //           if (myUser.user!.emailVerified) {
  //             signin(email, kpw);
  //           } else {
  //             Get.off(SignInScreen());
  //           }
  //         });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Get.defaultDialog(
  //           title: 'Register Gagal', middleText: 'Password Terlalu Lemah');
  //     } else if (e.code == 'email-already-in-use') {
  //       Get.defaultDialog(
  //           title: 'Register Gagal', middleText: 'Email Telah Digunakan');
  //     }
  //   }
  // }
  // // Future<UserCredential> logingoogle() async {
  // //   // Trigger the authentication flow
  // //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // //   // Obtain the auth details from the request
  // //   final GoogleSignInAuthentication? googleAuth =
  // //       await googleUser?.authentication;

  // //   // Create a new credential
  // //   final credential = GoogleAuthProvider.credential(
  // //     accessToken: googleAuth?.accessToken,
  // //     idToken: googleAuth?.idToken,
  // //   );

  // //   // Once signed in, return the UserCredential
  // //   await FirebaseAuth.instance.signInWithCredential(credential);

  // //   return await Get.offAllNamed(LoginSuccessScreen.routeName);
  // // }

  // Future<void> logingoogle(BuildContext context) async {
  //   try {
  //     if (kIsWeb) {
  //       GoogleAuthProvider googleProvider = GoogleAuthProvider();

  //       googleProvider
  //           .addScope('https://www.googleapis.com/auth/contacts.readonly');

  //       await auth.signInWithPopup(googleProvider);
  //     } else {
  //       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //       final GoogleSignInAuthentication? googleAuth =
  //           await googleUser?.authentication;

  //       if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
  //         // Create a new credential
  //         final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth?.accessToken,
  //           idToken: googleAuth?.idToken,
  //         );
  //         UserCredential userCredential =
  //             await auth.signInWithCredential(credential);

  //         // if you want to do specific task like storing information in firestore
  //         // only for new users using google sign in (since there are no two options
  //         // for google sign in and google sign up, only one as of now),
  //         // do the following:

  //         // if (userCredential.user != null) {
  //         //   if (userCredential.additionalUserInfo!.isNewUser) {}
  //         // }
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message!); // Displaying the error message
  //   }
  // }

  void signout() async {
    await auth.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
