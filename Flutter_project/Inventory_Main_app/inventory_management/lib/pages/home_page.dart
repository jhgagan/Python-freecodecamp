import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/home_page_mobile.dart';
import 'package:inventory_management/pages/home_page_desktop.dart';



class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color bgColor = Colors.black; 

  //sign user out method
  void signUserOut() {

    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
          );
      }, 
    );

    FirebaseAuth.instance.signOut();
    // pop the loading circle
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    
  final user = FirebaseAuth.instance.currentUser!;
  
    if (MediaQuery.of(context).size.width<600.0)
    {
      return HomePage_Mobile();
    }
    else{
      return HomePage_desktop();
    }
    
  }
}