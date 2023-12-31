import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:inventory_management/services/firestore.dart';



class Scanner extends StatefulWidget {
final bool pos;

  const Scanner({super.key, required this.pos});

  @override
  State<Scanner> createState() => _ScannerState();
  
}

class _ScannerState extends State<Scanner> {
  // firestore 
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,

      // AppBar 
      appBar: AppBar(
        leading: null, 

        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Scanner'),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Place the QR code in the area",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10,),

                Text("Scanner will be started automatically",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  ),),
              ]
            )),
            Expanded(
              flex: 3,
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;
                  for (final barcode in barcodes) {
                    debugPrint('Barcode found! ${barcode.rawValue}');
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (BuildContext context){
                        return Theme(
                          data: ThemeData(canvasColor: Colors.red),
                          child:AlertDialog(
                            backgroundColor: Colors.grey[900],
                          content: Text('BarCode found! ${barcode.rawValue}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        actions: [ElevatedButton(onPressed: (){
                          if(widget.pos)
                          {
                            firestoreService.deletePackage(barcode.rawValue as String, "Package Checked-out Sucessfully.");
                            Navigator.pop(context);
                          }
                          else{
                            firestoreService.addPackage(barcode.rawValue as String);
                            Navigator.pop(context);
                          }
                        },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),),
                      child: Text(getText(1, widget.pos),
                      style: const TextStyle(color: Colors.black))
                      ),
                      
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(getText(2, widget.pos),
                      style: const TextStyle(color: Colors.black),)
                      ),]

                      ),
                      );
                        
                      },
                    );
                    //------------------------------------------------------------
                  }
                  if (image != null) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Image(image: MemoryImage(image)),
                    );
                    Future.delayed(const Duration(seconds: 5), () {
                      Navigator.pop(context);
                    });
                  }
                },
              ),
              ),
              const Expanded(child: SizedBox(height:10)),
          ],)
      )

    );
  }

  String getText(int btn, bool posState){
    if(posState){
      if(btn == 1){
        return "Checkout";
      }
      else {
        return "Cancel";
      }
    } else {
      if(btn == 1){
        return "Add Package";
      }
      else {
        return "Cancel";
      }
    }



  }
}

