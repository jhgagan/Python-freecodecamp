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
  final TextEditingController textName = TextEditingController();
  final TextEditingController textCatName = TextEditingController();
  final TextEditingController textIssCntry = TextEditingController();
  final TextEditingController textPackage = TextEditingController();

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
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                // Name of the Package
                TextField(
                controller: textName,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText:'Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                ),
                // Name of the Category
                TextField(
                controller: textCatName,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText:'Category',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                ),
                // Barcode
                TextField(
                controller: textIssCntry,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText:'Issuing Country',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                ),

                TextField(
                controller: textPackage,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText:'Barcode',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                ),

              ],
            ),
          actions: [ElevatedButton(onPressed: (){
            // Check if the fields are empty
            if(textName.text.isNotEmpty && textCatName.text.isNotEmpty && textIssCntry.text.isNotEmpty && textPackage.text.isNotEmpty)
            {
              firestoreService.manuallyAddPackage(
                textName.text,
                textCatName.text,
                textPackage.text,
                textIssCntry.text
              );
              //clear the text controller
              textName.clear();
              textCatName.clear();
              textPackage.clear();
              textIssCntry.clear();

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
          // Clear the text fields
          textName.clear();
          textCatName.clear();
          textPackage.clear();
          textIssCntry.clear();

          // Pop the dialog box
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
 