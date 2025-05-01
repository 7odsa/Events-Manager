import 'package:events_manager/main.dart';
import 'package:events_manager/screens/register_screen.dart';
import 'package:events_manager/services/auth_service.dart';
import 'package:events_manager/utils.dart';
import 'package:events_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool convertToAr = false;

  bool validate() {
    // TODO

    if (emailController.text.isEmpty || passwordController.text.isEmpty)
      return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                logoImage(),
                SizedBox(height: 60),
                editText(
                  emailController,
                  "Email",
                  Icon(Icons.email_rounded),
                  null,
                  false,
                ),
                SizedBox(height: 20),
                editText(
                  passwordController,
                  "Password",
                  Icon(Icons.lock),
                  Icon(Icons.remove_red_eye_rounded),
                  true,
                ),
                SizedBox(height: 20),
                forgetPassword(
                  "Forget Password?",
                  // TODO
                  () {},
                ),
                SizedBox(height: 24),
                loginButton(),
                SizedBox(height: 24),
                createAcc(),
                SizedBox(height: 24),
                or(),
                SizedBox(height: 24),
                loginWithGoogle(),
                SizedBox(height: 24),
                languageToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoImage() {
    return Center(child: Image.asset("images/evently.png"));
  }

  Widget editText(
    TextEditingController controller,
    String hintText,
    Icon? prefixIcon,
    Icon? suffixIcon,
    bool isPassword,
  ) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      isPassword: isPassword,
    );
  }

  Widget forgetPassword(String text, void Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [clickableText(text, onTap)],
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

  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          AuthService.signin(
            email: emailController.text,
            password: passwordController.text,
          );
          print(validate());
        },
        child: Text("Login", style: white20),
      ),
    );
  }

  Widget createAcc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have Account?  ", style: black20bold),
        clickableText("Create Account", () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RegisterScreen();
              },
            ),
          );
        }),
      ],
    );
  }

  Widget or() {
    return Row(
      children: [
        SizedBox(width: 16),
        Expanded(child: Divider(color: seedColor, thickness: 2)),
        SizedBox(width: 16),
        Text("Or", style: black20bold),
        SizedBox(width: 16),
        Expanded(child: Divider(color: seedColor, thickness: 2)),
        SizedBox(width: 16),
      ],
    );
  }

  Widget loginWithGoogle() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // TODO
          print(validate());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          side: BorderSide(color: seedColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/google.png"),
            SizedBox(width: 8),
            Text("Login Via Google", style: blue20),
          ],
        ),
      ),
    );
  }

  Widget languageToggle() {
    return Row(
      children: [
        Text("Convert To Arabic: ", style: black20bold),
        Spacer(),
        Switch(
          activeColor: seedColor,
          value: convertToAr,
          onChanged: (value) {
            print(convertToAr);
            print(value);
            convertToAr = value;
            setState(() {});
          },
        ),
        Spacer(),
      ],
    );
  }
}
