import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/_http/_stub/_file_decoder_stub.dart';
import 'package:rap_trial/models/user_model.dart';
import 'package:rap_trial/services/storage_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AuthServices {
  static final _firabaseAuth = FirebaseAuth.instance;
  

  static Future<String> signup(
      {required String email, required String password}) async {
    String res = "Something went wrong";

    try {
      UserCredential _cred = await _firabaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static Future<String> login(
      {required String email, required String password}) async {
    String res = "Something went wrong";

    try {
      UserCredential _cred = await _firabaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }


 

static Future<bool> checkEmailExists(
  String email) async {
  try {
    List<String> signInMethods = await _firabaseAuth.fetchSignInMethodsForEmail(email);
    return signInMethods.isNotEmpty;
  } catch (e) {
    print('Error checking email existence: $e');
    return false; // Return false in case of any error
  }
}



}
