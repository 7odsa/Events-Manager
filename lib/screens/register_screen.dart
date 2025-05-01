import 'package:events_manager/services/auth_service.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final rePasswordController = TextEditingController();

  bool validate() {
    // TODO
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              logoImage(),
              SizedBox(height: 40),
              editText(
                controller: nameController,
                hintText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              editText(
                controller: emailController,
                hintText: "Email",
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              editText(
                controller: passwordController,
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
              ),
              SizedBox(height: 20),
              editText(
                controller: rePasswordController,
                hintText: "Re Password",
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
              ),
              SizedBox(height: 20),
              createAccountButton(),
              SizedBox(height: 20),
              backToLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoImage() {
    return Center(child: Image.asset("images/evently.png"));
  }

  Widget editText({
    required TextEditingController controller,
    required String hintText,
    Icon? prefixIcon,
    Icon? suffixIcon,
    bool isPassword = false,
  }) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      isPassword: isPassword,
    );
  }

  Widget backToLogin(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already Have Account?  ", style: black20bold),
        clickableText("Login", () {
          Navigator.pop(ctx);
        }),
      ],
    );
  }

  Widget clickableText(String text, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget createAccountButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await AuthService.signup(
            email: emailController.text,
            password: passwordController.text,
          );
          print(validate());
        },
        child: Text("SignUp", style: white20),
      ),
    );
  }
}
