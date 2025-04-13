import 'package:farmora/screens/home/dashboard.dart';
import 'package:farmora/utils/colors.dart';
import 'package:farmora/utils/customUtils.dart';
import 'package:farmora/utils/navigationUtils.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameError;
  String? passwordError;

  void validateUsername(String value) {
    setState(() {
      if (value.isEmpty) {
        usernameError = "Username cannot be empty";
      } else if (value.length < 3) {
        usernameError = "Username must be at least 3 characters";
      } else {
        usernameError = null; // No error
      }
    });
  }

  void validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        passwordError = "Password cannot be empty";
      } else if (value.length < 6) {
        passwordError = "Password must be at least 6 characters";
      } else {
        passwordError = null; // No error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: usernameController,
                    onChanged: validateUsername,
                    decoration: InputDecoration(
                      labelText: "Username",
                      // border: OutlineInputBorder(),
                      errorText: usernameError,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    onChanged: validatePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      // border: OutlineInputBorder(),
                      errorText: passwordError,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomButton(
                        text: "Log In",
                        onPressed: () {
                          NavigationUtils.navigateTo(context, Dashboard());
                        },
                        color: ColorUtils().primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Don't have an account? Create account now",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
