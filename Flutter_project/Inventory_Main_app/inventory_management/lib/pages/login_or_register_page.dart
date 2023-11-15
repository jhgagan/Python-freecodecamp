import 'package:flutter/material.dart';
import 'package:inventory_management/pages/login_page.dart';
import 'package:inventory_management/pages/register_page.dart';

class LoginPageOrRegister extends StatefulWidget {
  const LoginPageOrRegister({super.key});

  @override
  State<LoginPageOrRegister> createState() => _LoginPageOrRegisterState();
}

class _LoginPageOrRegisterState extends State<LoginPageOrRegister> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}