import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Uint8List? file;

  // adding image to firebase storage
  Future<String> uploadImage(
      String image, String profile, Uint8List file) async {
    Reference ref = _storage
        .ref()
        .child(image)
        .child(profile)
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> addImage({required Uint8List file}) async {
    try {
      String res = "something went wrong";
      String imageUrl =
          await uploadImage('Image Folder', "profile Image", file);
      _firestore
          .collection('Players')
          .doc(_auth.currentUser!.uid)
          .update(
        {'imageLink': imageUrl},
      );
      res = "success";
      return res;
    } catch (e) {
      return e.toString();
    }
  }
}