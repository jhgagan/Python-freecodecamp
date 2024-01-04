import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/services/firestore.dart';

class UserHome extends StatefulWidget {


  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}
 
class _UserHomeState extends State<UserHome> {

  // firestore
  final FirestoreService firestoreService = FirestoreService();

  //text controller
  final TextEditingController textController = TextEditingController();

  String monthString (int month){
    String retMonth = "month";
    switch(month)
    {
      
      case 1:
      retMonth =  "Jan";
      
      case 2:
      retMonth =  "Feb";
      
      case 3:
      retMonth =  "Mar";
      
      case 4:
      retMonth =  "Apr";
      
      case 5:
      retMonth =  "May";

      case 6:
      retMonth =  "June";
      
      case 7:
      retMonth =  "Jul";
      
      case 8:
      retMonth =  "Aug";
      
      case 9:
      retMonth =  "Sep";
      
      case 10:
      retMonth =  "Oct";
      
      case 11:
      retMonth =  "Nov";
      
      case 12:
      retMonth =  "Dec";
    }
    return retMonth;
  }

  void showScannerBox(String docID) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(

          actions: [ElevatedButton(onPressed: (){
            //update an existing note
            firestoreService.getPackageData(docID);

            //close the box
            Navigator.pop(context);
          },
        child: const Text("OK"), )]

        ),
      );
  }

  @override
  Widget build(BuildContext context) {

    //final user = FirebaseAuth.instance.currentUser!;

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
                  String packageText = data['name'];
                  String? packageSubtitle = data['Category'];
                  DateTime packageTime = data['TimeStamp'].toDate();
                  
                  String year = packageTime.year.toString();
                  String month = monthString(packageTime.month);
                  String day = packageTime.day.toString();
                  final date = "$month $day, $year";
                  String time = '${packageTime.hour.toString()}:${packageTime.minute.toString()}';
                  String barcode = data['Barcode'];
                  
                  packageSubtitle ??= 'Not found';
                  
        
                  // display as a list tile
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      //Title of the ListTile
                      title: Text(packageText,
                        style: const TextStyle(color: Colors.green,
                        fontSize: 16),
                        ),
                      // Subtitle containing the Category of the item
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Category of the item
                              Text(packageSubtitle,
                              style: TextStyle(color: Colors.grey[300])),
                              // Date when it was added
                              Text( date,
                              style: const TextStyle(color: Colors.grey)),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // BArcode
                            Text(barcode,
                            style: TextStyle(color: Colors.grey[300])),
                            // Time when it was added
                            Text(time ,
                            style: const TextStyle(color: Colors.grey)),
                            ],)
                    
                    
                      ]),
                      // Date when it was added,
                      
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              firestoreService.deletePackage(docID,"Package delete Successfully.");
                              },
                            icon: const Icon(Icons.delete,
                            color: Colors.grey,),
                          ),
                        ],
                      ),
                      onTap: (){
                      },
                      
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
 