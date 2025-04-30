import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final rePasswordController = TextEditingController();

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
}
