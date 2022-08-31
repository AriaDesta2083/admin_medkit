import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medkit_app/screens/login_success/login_success_screen.dart';
import 'package:medkit_app/screens/sign_in/sign_in_screen.dart';

class AuthControl extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  //!LOGIN
  void loginCont(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(LoginSuccessScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('no user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong passsword for that user');
      }
    }
  }

  //! REGISTER

  void regisCont(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(LoginSuccessScreen.routeName);
    } catch (e) {}
  }

  //! LOGOUT
  void logoutCont() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(SignInScreen.routeName);
  }

  //! RESET PASSWORD
  void resetPassCont() {
    //*.....................
  }

  //!! VERIFIKASI EMAIL
  void verifEmailCont() {
    //*......................
  }
}
