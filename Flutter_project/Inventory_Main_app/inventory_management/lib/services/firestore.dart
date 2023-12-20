import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  //get collection of inventory 
  final CollectionReference inventory =
    FirebaseFirestore.instance.collection('inventory');

  //Create: add a new package
  Future<void> addPackage(String package) {
    return inventory.add({
      'package': package,
      'timestamp': Timestamp.now(),
    });
  }
  
  //Read: get info from database
  Stream<QuerySnapshot> getPackageStream() {
    final packageStream = 
     inventory.orderBy('timestamp', descending:true).snapshots();

     return packageStream;
  }
  
  //Update: update info given a doc id
  Future<void> updatePackage(String docID, String newPackage) {
    return inventory.doc(docID).update({
      'package':newPackage,
      'timestamp':Timestamp.now(),
    });
  }
  
  //Delete: delete info given a doc id
  Future<void> deletePackage(String docID) {
    return inventory.doc(docID).delete();
  }
}