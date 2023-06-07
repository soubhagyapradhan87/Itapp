import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseService {
  CollectionReference employees = FirebaseFirestore.instance.collection('employees');

  // CollectionReference ram = FirebaseFirestore.instance.collection('ram');

  Future<void> addEmployee(String empName, empId, designation, mobileNo, location, gender, officialMailId,
      bool isAccessoriesAssigned) async {
    DocumentReference docref = employees.doc(empId);

    docref
        .set({
          'emp_name': empName,
          'emp_id': empId,
          'designation': designation,
          'mobile_no': mobileNo,
          'location': location,
          'gender': gender,
          'official_mail_id': officialMailId,
          'is_accessories_assigned': isAccessoriesAssigned
        })
        .then((value) => print("user added"))
        .catchError((error) => print("Failed to add user:$error"));
  }

  Future<void> addLaptop(
      String transaction, company, hdd, model, processor, ram, int numberOfItem, List<String> items) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('laptop');
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('laptop')
        .where('company', isEqualTo: company)
        .where('model', isEqualTo: model)
        .get();
    if (snapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;
        List<dynamic>? existingArray = documentData['items']?.toList();
        existingArray!.addAll(items);
        doc.reference.update({'items': existingArray});
        if (existingArray.isNotEmpty) {
          print(existingArray);
        } else {
          print('arrayField does not exist in the document with ID: ${doc.id}');
        }
      }
    } else {
      collectionReference.add({
        'transaction': transaction,
        'company': company,
        'hdd': hdd,
        'ram': ram,
        'model': model,
        'processor': processor,
        'number of item': numberOfItem,
        'items': items
      });
    }
  }


  Future<bool> checkSerialNumberExistence(String serialNumber) async {
    // CollectionReference collection = FirebaseFirestore.instance.collection('laptop');

    QuerySnapshot checkSerialNoSnapshot = await FirebaseFirestore.instance
        .collection('laptop')
        .where('items', arrayContains: serialNumber)
        .get();

    if (checkSerialNoSnapshot.docs.isNotEmpty) {
      // Serial number exists
      print('Serial number $serialNumber exists.');
      return true;

    } else {
      // Serial number does not exist
      print('Serial number $serialNumber does not exist.');
      return false;

    }
  }


  Stream<int> getItemCountStream() {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('laptop');

    Stream<QuerySnapshot> snapshots = collectionRef.snapshots();

    return snapshots.map((QuerySnapshot querySnapshot) {
      int itemCount = 0;

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> documentData = docSnapshot.data() as Map<String, dynamic>;
        List<dynamic>? items = documentData['items']?.toList();

        itemCount += items!.length;
      }

      return itemCount;
    });
  }

  Future<bool> documentExistsInCollection(String collectionName, String docId) async {
    try {
      var doc = await FirebaseFirestore.instance.collection(collectionName).doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  Future<List<String>> fetchItems(String collectionName, itemName) async {
    List<String> itemList = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection(collectionName).get();

    for (var document in snapshot.docs) {
      itemList.add(document.data()[itemName]);
    }

    return itemList;
  }

  Future<DocumentSnapshot> fetchSubcollectionDocument(String empid) async {
    DocumentReference parentDocRef = employees.doc(empid);

    DocumentReference subcollectionDocRef = parentDocRef.collection('accessories').doc(empid);

    return await subcollectionDocRef.get();
  }
}
