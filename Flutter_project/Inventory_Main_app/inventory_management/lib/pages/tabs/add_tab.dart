import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/services/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:inventory_management/pages/tabs/scanner.dart';

class AddItem extends StatefulWidget {


  AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}
 
class _AddItemState extends State<AddItem> {
  // firestore 
  final FirestoreService firestoreService = FirestoreService();


  //text controller
  final TextEditingController textController = TextEditingController();

  // open a dialog box to add the package/stock
  void openScannerBox() {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [ElevatedButton(onPressed: (){
            if (textController.text.isNotEmpty)
            {
              firestoreService.addPackage(textController.text);
              //clear the text controller
              textController.clear();

              //close the box
              Navigator.pop(context);
            }
          },
        child: Text("Add"), )]

        ),
      );
  }


  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Center(
        child: Column(
          children: [
            Expanded(
              child:Lottie.asset(
                    'lib/animations/add_package.json',
                    repeat: true,
                    fit: BoxFit.fitWidth,
                  )
            ),
            FloatingActionButton(
              onPressed: openScannerBox,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(Icons.add),
              ),
          ],
        ),
      );
  }

} 
 