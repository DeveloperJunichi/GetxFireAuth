import 'package:firebase_auth_getx/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ログイン画面",
                style: Get.textTheme.headline3,
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'メールアドレスを入力してください',
                  labelText: 'email'
                ),
                controller: emailController,
              ),
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
