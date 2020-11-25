import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settle_group_expenses/ModalClasses/ModalGroups.dart';

class DatabaseService{

  //Collection reference
  final CollectionReference coll_groups = FirebaseFirestore.instance.collection('Groups');

  //Create

  //Create a new group
  Future<void> createGroup(String gname, String currency, String destination, String description) async{
    return await coll_groups.doc().set({
      'gname' : gname,
      'currency' : currency,
      'destination' : destination,
      'description' : description,
    })
        .then((value) => Fluttertoast.showToast(
      msg: 'Group created',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    ))
        .catchError((error) => Fluttertoast.showToast(
      msg: 'Failed creating group',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    ));
  }

  //Read

  //Get all groups

  Stream<List<Groups>> get getGroups{
    return coll_groups.snapshots()
        .map((_groupListFromSnapShot));
  }
  //Update
  //Delete

  //Lists

  //Group List
  List <Groups> _groupListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Groups(
        gname: doc.data()['gname'],
        currency: doc.data()['currency'],
        destination: doc.data()['destination'],
        description: doc.data()['description']
      );
    }).toList();
  }

}

