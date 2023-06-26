import 'package:basic_ecommerce_app_with_getx/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addusertoFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userid).set(userModel.toJson());
  }
}
