import 'package:flutter/material.dart';
import 'package:inventory_management/components/ui_textfield.dart';
import 'package:inventory_management/components/ui_mybutton.dart';
import 'package:inventory_management/pages/rst_pswrd_successful.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final bgColor = Colors.black;
  // Text editing controller
  final rstPsswrdController = TextEditingController();
  final rstPsswrdConfirmController = TextEditingController();

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
        title: const Text('Reset Password'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: 350.0,
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50,),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [

                  const SizedBox(height: 50),
                  
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      ),
                    ),

                  const SizedBox(height: 50),

                  TextFieldUI(
                    controller: rstPsswrdController,
                    hintText: 'New Password', 
                    obscureText: true),

                  const SizedBox(height: 30),

                  TextFieldUI(
                    controller: rstPsswrdConfirmController,
                    hintText: 'Re-enter New Password',
                    obscureText: true),

                  const SizedBox(height: 50),

                  MyButton(nextPage: ResetPasswordSuccessful(),
                    buttonText: 'Reset Password', 
                    fgColor: Colors.black,
                    fgColorPressed: Colors.grey.shade800,
                    bgColor: Colors.white,
                    bgColorPressed: Colors.grey.shade400,),

              ]),
            )
          ),
        ),
      ),
    );
  }  
}