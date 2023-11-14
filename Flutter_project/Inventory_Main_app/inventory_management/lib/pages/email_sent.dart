import 'package:flutter/material.dart';
import 'package:inventory_management/components/ui_mybutton.dart';
import 'package:inventory_management/pages/reset_password.dart';

class emailSent extends StatelessWidget{
  emailSent({super.key});

  final bgColor = Colors.black;
  
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
        title: const Text('Email Sent'),

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
                  child: Text('Please check your e-mail for the link to change password.',
                    style:TextStyle(
                      color: Colors.grey.shade400, 
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Remove this button after the email authentication part is sorted out

                MyButton(nextPage: ResetPassword(), 
                  buttonText: 'Reset Password', 
                  fgColor: Colors.black,
                  fgColorPressed: Colors.grey.shade800,
                  bgColor: Colors.white,
                  bgColorPressed: Colors.grey.shade400,),
                  
                  const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      )
    );
  }
}