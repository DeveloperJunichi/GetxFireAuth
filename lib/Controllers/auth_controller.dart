import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_getx/Constants/firebase_constants.dart';
import 'package:firebase_auth_getx/Screens/home.dart';
import 'package:firebase_auth_getx/Screens/login.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() => const Home());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => Login());
    }
  }
  // ユーザーの新規登録をする関数
  void register(String email, String password) async {
    try {
      // ユーザーのプロファイル情報を取得する
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // エラーのスナックバーを表示する
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }
  // ユーザーがログインをする関数
  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }
  // ユーザーがログアウトする関数
  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
