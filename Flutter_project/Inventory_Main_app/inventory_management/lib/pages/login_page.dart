import 'package:flutter/material.dart';
import 'package:inventory_management/components/square_tile.dart';
import 'package:inventory_management/pages/forgot_password.dart';
import 'package:inventory_management/pages/logged_in.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/components/ui_mybutton.dart';
//import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ), 

        backgroundColor: bgColor,
        elevation: 0,
        title: const Text('Sign In'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: 350.0,
          ),
        ),
      ),

      // login area
      body:SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
              const SizedBox(height: 30),

              // logo
              const Icon(Icons.lock,
              size: 100,
              color: Colors.white,
              ),
            
              const SizedBox(height: 25),
            
              // Welcome back
              const Text('Welcome Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              
              const SizedBox(height: 20),

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
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                        },
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

              const SizedBox(height:10),

              // sign in button
              MyButton(nextPage: const SignUserIn(), 
              buttonText: 'SIGN IN', 
              fgColor: Colors.black,
              fgColorPressed: Colors.grey.shade800,
              bgColor: Colors.white,
              bgColorPressed: Colors.grey.shade400,),
              
              const SizedBox(height: 30,),

              // or continue with 

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[200],
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal:10.0),
                      child: Text('Or continue with',
                        style: TextStyle(color: Colors.grey,),
                        ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // google + apple + microsoft sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 10),
                  
                  //apple button
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),

              const SizedBox(height: 40),

              // Not a member? register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an Account?',
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                  // Register now button
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        foregroundColor:Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Register now',
                      style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )  
          ]),
        ),
      ),
      )
    );
  }
}


