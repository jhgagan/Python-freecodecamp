import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: const SafeArea(
        child:Center(
          child: Column(

          children: [
            SizedBox(height: 50),

            // logo
            Icon(Icons.lock,
            size: 100,
            color: Colors.white,
            ),
            
            SizedBox(height: 50),
            
            // Welcome back
            Text('Welcome Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
            // username textfield

            // password textfield

            // forgot password?

            // sign in button

            // or continue with 

            // google + apple + microsoft sign in buttons

            // Not a member? register now
          ]),
        ),
      )
    );
  }
}


/*
class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
              decoration: const InputDecoration(
                filled: true,

                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Email Address',
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,

              fillColor: Colors.white,
              border: UnderlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextButton(
            onPressed: () {} ,
            child: Text('Forgot Your Password?', style: TextStyle(fontSize: 12))),
        ),
      ],
    );
  }
}*/