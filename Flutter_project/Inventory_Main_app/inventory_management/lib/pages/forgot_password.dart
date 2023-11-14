import 'package:flutter/material.dart';
import 'package:inventory_management/components/ui_mybutton.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/pages/email_sent.dart';

class ForgotPassword extends StatelessWidget {
  final Color bgColor = Colors.black;

  ForgotPassword({super.key});
  
  // text editing controller
  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Forgot Password'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: 350.0,
          ),
        ),
      ),

      body:SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(

              children: [
                const SizedBox(height: 30),

                // logo 
                const Icon(Icons.lock_outlined,
                size: 100,
                color: Colors.white,
                ),

                const SizedBox(height:50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50.0),
                  child: Text('Enter your email and we\'ll send you a link to change a new password',
                    style:TextStyle(
                      color: Colors.grey.shade400, 
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30.0),
                  child: TextFieldUI(controller: emailController,
                    hintText: 'Email Address',
                    obscureText: false
                  ),
                ),

                const SizedBox(height: 50),

                MyButton(nextPage: emailSent(),
                buttonText: 'Forgot Password',
                fgColor: Colors.black,
                fgColorPressed: Colors.grey.shade800, 
                bgColor: Colors.white, 
                bgColorPressed: Colors.grey.shade400),


              ],
            ),
          ),
        ),
      )
    );
  }
}