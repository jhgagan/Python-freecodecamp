import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:inventory_management/pages/tabs/scanner.dart';

class QRScanner extends StatefulWidget {


  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}
 
class _QRScannerState extends State<QRScanner> {

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Center(
        child: Column(
          children: [
            Expanded(
              child:Lottie.asset(
                    'lib/animations/checkout.json',
                    repeat: true,
                    fit: BoxFit.fitWidth,
                  )
            ),

            Text("LOGGED IN AS: ${user.email!}",
              style: const TextStyle(
                color:Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:20),

            FloatingActionButton(
              onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const Scanner(pos: true)),);
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(Icons.qr_code_scanner),
              ),
          ],
        ),
      );
  }

} 
 