import 'package:firebase_auth_getx/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  // メールアドレスを登録するTextEditingController
  final emailController = TextEditingController();
  // パスワードを登録するTextEditingController
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          // vertical(垂直), horizontal(水平)で余白を作りたいラインを指定して余白が作れます。
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ログイン画面",
                style: Get.textTheme.headline3,
              ),
              // メールアドレスを入力するテキストフィールド
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'メールアドレスを入力してください',
                  labelText: 'email'
                ),
                controller: emailController,
              ),
              // パスワードを入力するテキストフィールド
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'パスワードを入力してください',
                  labelText: 'password'
                ),
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                // spaceAroundは、子要素の間に均等なスペースを空ける
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // this is for the register function in auth controller
                      AuthController.authInstance.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: const Text("新規登録"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // this is for the login function in auth controller
                      AuthController.authInstance.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: const Text("ログイン"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
