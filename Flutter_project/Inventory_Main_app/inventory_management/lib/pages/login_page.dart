import 'package:flutter/material.dart';
import 'package:inventory_management/pages/logged_in.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/components/ui_mybutton.dart';



class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,

      // AppBar 
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ), 

        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Sign In'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 2.0,
            width: 370.0,
          ),
        ),
      ),

      // login area
      body: SafeArea(
        child:Center(
          child: Column(

          children: [
            const SizedBox(height: 50),

            // logo
            const Icon(Icons.lock,
            size: 100,
            color: Colors.white,
            ),
            
            const SizedBox(height: 50),
            
            // Welcome back
            const Text('Welcome Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
            
            const SizedBox(height: 25),

            // username textfield
            TextFieldUI(
              controller: usernameController,
              hintText: 'Email Address',
              obscureText: false,
              ),

            const SizedBox(height: 10),
            // password textfield
            TextFieldUI(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              ),

            const SizedBox(height: 10),
            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      foregroundColor:Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Forgot Your Password?'),
                  )
                ],
              ), 
            ),

            const SizedBox(height: 25),

            // sign in button
            MyButton(nextPage: const LoggedInPage(), 
            buttonText: 'SIGN IN', 
            fgColor: Colors.black,
            fgColorPressed: Colors.grey.shade800,
            bgColor: Colors.white,
            bgColorPressed: Colors.grey.shade400,)
            // or continue with 

            // google + apple + microsoft sign in buttons

            // Not a member? register now
          ]),
        ),
      )
    );
  }
}


