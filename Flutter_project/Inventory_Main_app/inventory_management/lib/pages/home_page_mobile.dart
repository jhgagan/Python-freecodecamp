import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventory_management/pages/tabs/sustainability_page.dart';
import 'package:inventory_management/pages/tabs/add_tab.dart';
import 'package:inventory_management/pages/tabs/scanner_tab.dart';
import 'package:inventory_management/pages/tabs/home_tab.dart';


class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

// ignore: camel_case_types
class _HomePageMobileState extends State<HomePageMobile> {
  final Color bgColor = Colors.black; 
  
    int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
      //print("Selected index: $_selectedIndex");  
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
    const Text('Inventory Management',
    style: TextStyle(color: Colors.white),),
    const Text('Add Stock',
    style: TextStyle(color: Colors.white),),
    const Text('Point of Sale',
    style: TextStyle(color: Colors.white),),
    const Text('Sustainability',
    style: TextStyle(color: Colors.white),),
  ];

  final List<Widget> pages = [
    const UserHome(),
    
    const AddItem(),

    const QRScanner(),

    const Sustainability(),
  ];
    
  
    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,

      // AppBar 
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_rounded), color: Colors.grey.shade400,)
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

          GButton(icon: Icons.energy_savings_leaf,
          text: 'Sustainability',
          ),
        ]),
    );
  }
}