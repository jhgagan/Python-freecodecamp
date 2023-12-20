import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventory_management/pages/tabs/add_tab.dart';
import 'package:inventory_management/pages/tabs/scanner_tab.dart';
import 'package:inventory_management/pages/tabs/home_tab.dart';


class HomePage_Mobile extends StatefulWidget {
  HomePage_Mobile({super.key});

  @override
  State<HomePage_Mobile> createState() => _HomePage_MobileState();
}

// ignore: camel_case_types
class _HomePage_MobileState extends State<HomePage_Mobile> {
  final Color bgColor = Colors.black; 
  
    int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
      print("Selected index: ${_selectedIndex}");  
    });
    }
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

  final List<Text> title = [
    Text('Inventory Management'),
    Text('Add Stock'),
    Text('Point of Sale')
  ];

  final List<Widget> pages = [
    UserHome(),
    
    AddItem(),

    QRScanner(),

  ];
    
  
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_rounded))
        ],
        leading: null, 

        backgroundColor: bgColor,
        elevation: 0,
        title: title[_selectedIndex],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),

      body: pages[_selectedIndex],

      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.grey.shade600,
        activeColor: Colors.white,
        gap: 8,
        onTabChange: _navigateBottomBar,
        tabs: const [
          GButton(icon: Icons.home,
          text: 'Home',
          ),
          
          GButton(icon: Icons.inventory_outlined,
          text:'Add',
          ),
          
          GButton(icon: Icons.store,
          text: 'Store',
          ),
        ]),
    );
  }
}