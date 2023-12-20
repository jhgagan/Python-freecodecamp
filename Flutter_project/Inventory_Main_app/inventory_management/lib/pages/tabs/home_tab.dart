import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/services/firestore.dart';
import 'package:lottie/lottie.dart';

class UserHome extends StatefulWidget {


  UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}
 
class _UserHomeState extends State<UserHome> {

  // firestore
  final FirestoreService firestoreService = FirestoreService();

  //text controller
  final TextEditingController textController = TextEditingController();

  void updateScannerBox(String docID) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [ElevatedButton(onPressed: (){
            //update an existing note
            firestoreService.updatePackage(docID,textController.text);
            
            //clear the text controller
            textController.clear();

            //close the box
            Navigator.pop(context);
          },
        child: const Text("Update"), )]

        ),
      );
  }

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getPackageStream(),
           builder: (context, snapshot) {
            if(snapshot.hasData) {
              List packageList = snapshot.data!.docs;
        
              return ListView.builder(
                itemCount: packageList.length,
                itemBuilder: (context, index){
                  //get each individual doc
                    DocumentSnapshot document = packageList[index];
                    String docID = document.id;
        
                  //get note from each doc
                  Map<String, dynamic> data = 
                    document.data() as Map<String,dynamic>;
                  String packageText = data['package'];
        
                  // display as a list tile
                  return Container(
                    child: ListTile(
                      title: Text(packageText,
                      style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // update button
                          IconButton(
                            onPressed: () => updateScannerBox(docID),
                            icon: const Icon(Icons.settings,
                            color: Colors.grey,),
                          ),
                  
                          // delete button
                          IconButton(
                            onPressed: () => firestoreService.deletePackage(docID),
                            icon: const Icon(Icons.delete,
                            color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return const Text("no package...");
            }
           } 
          ),
      );
  }

} 
 