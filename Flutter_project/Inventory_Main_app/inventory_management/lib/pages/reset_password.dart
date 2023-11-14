import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

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
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
            
            ]),
          )
        ),
      ),
    );
  }  
}