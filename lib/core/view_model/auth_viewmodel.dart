import 'package:basic_ecommerce_app_with_getx/core/services/firestore_user.dart';
import 'package:basic_ecommerce_app_with_getx/model/user_model.dart';
import 'package:basic_ecommerce_app_with_getx/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;
  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void signinwithfacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    await _auth.signInWithCredential(facebookAuthCredential).then((user) {
      saveuserCredential(user);
    });
  }

/* void signinwithfacebook() async {
  final AccessToken result = await FacebookAuth.instance.login() as AccessToken;

  final OAuthCredential oAuthCredential =
      FacebookAuthProvider.credential(result.token);

  final FacebookAuthCredential facebookAuthCredential =
      oAuthCredential as FacebookAuthCredential;

  await _auth.signInWithCredential(facebookAuthCredential).then((user) {
    saveuserCredential(user);
  });
} */

  void signinwithgoogle() async {
    final GoogleSignInAccount? googleuser = await _googlesignin.signIn();
    //print(googleuser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential);

    Get.offAll(() => (HomePage()));
  }

  void signout() {}

  void SignInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => (HomePage()));
    } catch (e) {
      print(e);
      Get.snackbar('auth error', e.toString());
    }
  }

  void CreateAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveuserCredential(user);
      });

      Get.offAll(() => (HomePage()));
    } catch (e) {
      print(e);
      Get.snackbar('auth error', e.toString());
    }
  }

  void saveuserCredential(UserCredential user) async {
    await FireStoreUser().addusertoFireStore(UserModel(
      userid: user.user!.uid,
      email: user.user?.email ?? '',
      name: name ?? user.user!.displayName ?? '',
      photo: "",
    ));
  }
}
