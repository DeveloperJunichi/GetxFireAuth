import 'package:firebase_auth_getx/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("こんにちは!"),
        actions: [
          IconButton(
              onPressed: () {
                // this icon button is for the user to signout
                AuthController.authInstance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ログイン後の画面")
            ],
          ),
        ),
      ),
    );
  }
}
