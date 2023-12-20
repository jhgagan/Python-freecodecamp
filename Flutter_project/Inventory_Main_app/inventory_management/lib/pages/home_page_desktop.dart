import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage_desktop extends StatefulWidget {
  HomePage_desktop({super.key});

  @override
  State<HomePage_desktop> createState() => _HomePage_desktopState();
}

class _HomePage_desktopState extends State<HomePage_desktop> {
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
  
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_rounded))
        ],
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ), 

        backgroundColor: bgColor,
        elevation: 0,
        title: const Text('Inventory Management'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),

      body: Center(
        child: Text("LOGGED IN AS: ${user.email!}",
          style: const TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}