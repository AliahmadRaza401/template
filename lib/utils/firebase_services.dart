import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'api_constants.dart';

class FirebaseServices{
 static Future<String> uploadImageToFirebase(File imageFile, String folderName) async {
   print('uploading image to firebase');
    FirebaseStorage storage = FirebaseStorage.instance;
    var imgId = ApiConstants.generate6DigitId();
    Reference ref = storage.ref().child(folderName).child('img_$imgId');
    UploadTask uploadTask = ref.putFile(imageFile);

    try {
      await uploadTask;
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return '';
    }
  }


static Future<bool> deleteDocument(String collection, String docId) async {
   try {
     await FirebaseFirestore.instance.collection(collection).doc(docId).delete();
     return true;
   } catch (e) {
     print("Error deleting document: $e");
     return false;
   }
 }
 static Future<bool> updateDocument(String collection, String docId,Map<String,dynamic> data) async {
   try {
     await FirebaseFirestore.instance.collection(collection).doc(docId).update(data);
     return true;
   } catch (e) {
     print("Error deleting document: $e");
     return false;
   }
 }
}