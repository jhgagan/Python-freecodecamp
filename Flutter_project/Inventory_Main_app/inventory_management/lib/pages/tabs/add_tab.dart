import 'package:flutter/material.dart';
import 'package:inventory_management/services/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:inventory_management/pages/tabs/scanner.dart';

class AddItem extends StatefulWidget {
  
  const AddItem({super.key});

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
        barrierColor: Colors.black.withOpacity(0.3),
        builder: (BuildContext context){
          return Theme(
            data: ThemeData(canvasColor: Colors.red),
            child:AlertDialog(
              backgroundColor: Colors.grey[900],
            content: TextField(
            controller: textController,
            style: const TextStyle(color: Colors.white),
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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),),
        child: const Text("Add",
        style: TextStyle(color: Colors.black))
        ),
        
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: const Text("Cancel",
        style: TextStyle(color: Colors.black),)
        ),]

        ),
        );
          
        },
      );
  }


  @override
  Widget build(BuildContext context) {

    //final user = FirebaseAuth.instance.currentUser!;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[ 


                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FloatingActionButton(
                  heroTag: "manual_add",
                  onPressed: openScannerBox,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.add),
                  ),
                ),

                // Spacing
                
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FloatingActionButton(
                    heroTag: "qr_scanner",
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const Scanner(pos: false)),);
                   },
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.qr_code_scanner),
                  ),
                ),
              ]
            )
            
          ],
        ),
      ); 
  }
} 
 