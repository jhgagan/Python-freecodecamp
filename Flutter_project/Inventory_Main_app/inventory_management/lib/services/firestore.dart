import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreService{

  //user details
  static final user = FirebaseAuth.instance.currentUser!;
  static String email = user.email!;
  //get collection of inventory 

  final CollectionReference inventory =
    FirebaseFirestore.instance.collection(email);

  //Create: add a new package
  Future<void> addPackage(String package) async{
    // API call to fetch the information about the product
    String url = 'https://api.ean-search.org/api?token=8250c491169cb9012163dcd1f12e5c073302d7b2&op=barcode-lookup&ean=$package&format=json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // API response code
    int statusCode = response.statusCode;
    if(statusCode == 200)
    {
      final body = response.body;
      // decode the call
      final product = jsonDecode(body)[0];

      if(product['name'] != null)
      {
        final name = product['name'];
        final categoryName = product['categoryName'];
        final issuingCountry = product['issuingCountry'];
        bool alreadyExists = false;
        // Checking for duplicates
        final QuerySnapshot result = 
        await inventory.get();
        for (var element in result.docs) {
          if(element.id == package)
          {
            alreadyExists = true;
          }
        }

        if(alreadyExists == false)
        {
          inventory.doc(package).set({
            'name':name,
            'Category':categoryName,
            'Barcode':package,
            'Issuing Country': issuingCountry,
            'TimeStamp':Timestamp.now(),
          });

          // Flutter Toast to notify added successfully
          Fluttertoast.showToast(
              msg: "Package $name added Sucessfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              fontSize: 16.0
          );
        }
        else{
          Fluttertoast.showToast(
              msg: "Package $name already exists in the inventory.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              fontSize: 16.0
          );
        }
        
      }
      else
      {
        Fluttertoast.showToast(
              msg: "Invalid Barcode.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              fontSize: 16.0
          );
      }
    }
    else{
      Fluttertoast.showToast(
              msg: "API error!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              fontSize: 16.0
          );
    }
  }
  
  //Read: get info from database
  Stream<QuerySnapshot> getPackageStream() {
    final packageStream = 
     inventory.orderBy('TimeStamp', descending:true).snapshots();

     return packageStream;
  }
  
  getPackageData(String package) {
    // initialize the list here
    return inventory.doc(package).get();
  }

  // To manually add the package to the inventory

  Future<void> manuallyAddPackage(String name,
  String categoryName,
  String package,
  String issuingCountry) {
    return inventory.doc(package).set({
      'name':name,
      'Category':categoryName,
      'Barcode':package,
      'Issuing Country': issuingCountry,
      'TimeStamp':Timestamp.now()}
    );
  }

  //Update: update info given a doc id
  Future<void> updatePackage(String docID, String newPackage) {
    return inventory.doc(docID).update({
      'name':newPackage,
      'timestamp':Timestamp.now(),
    });
  }
  
  //Delete: delete info given a doc id
  void deletePackage(String docID, String message) async {
    bool exists = false;
    // Checking for duplicates
    final QuerySnapshot result = 
    await inventory.get();
    for (var element in result.docs) {
      if(element.id == docID)
      {
        exists = true;
      }
    }

    if(exists == true)
    {
      inventory.doc(docID).delete();

      Fluttertoast.showToast(
                msg: "$message ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                fontSize: 16.0
            );
    }
    else{
      Fluttertoast.showToast(
                msg: "Item not present in the inventory.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                fontSize: 16.0
            );
    }

    return;
  }

}