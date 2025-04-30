import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          logoImage(),
          editText(),
          editText(),
          forgetPasswordText(),
          loginButton(),
          createAcc(),
          or(),
          loginWithGoogle(),
          languageToggle(),
        ],
      ),
    );
  }

  Widget logoImage() {
    return Image.asset("images/evently.png");
  }

  Widget editText() {
    return Text("data");
  }

  Widget forgetPasswordText() {
    return Text("data");
  }

  Widget loginButton() {
    return Text("data");
  }

  Widget createAcc() {
    return Text("data");
  }

  Widget or() {
    return Text("data");
  }

  Widget loginWithGoogle() {
    return Text("data");
  }

  Widget languageToggle() {
    return Text("data");
  }
}
