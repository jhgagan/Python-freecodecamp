import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QRScanner extends StatefulWidget {


  QRScanner({super.key});

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

            Container(
              child: Text("LOGGED IN AS: ${user.email!}",
                style: const TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
  }

} 
 