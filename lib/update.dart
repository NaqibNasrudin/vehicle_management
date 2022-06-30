import 'dart:convert';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class UpdateVehicle extends StatefulWidget {
  @override
  _UpdateVehicleState createState() => _UpdateVehicleState();
}

class _UpdateVehicleState extends State<UpdateVehicle> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  var id;

  void _setId(String text) {
    setState(() {
      id = text;
    });
  }

  void _read() async {
    //DocumentSnapshot documentSnapshot;
      //documentSnapshot = await firestore.collection('users').doc('JKU 7840').get();
      //CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users').doc('JTP 2939').get();
      var info = firestore.collection('owners');
      var docSnapshot = await info.doc(id).get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        var Name = data?['Name'];
        var Contact = data?['Contact'];
        var Model = data?['VehicleModel'];
        _showDialog(Name,Contact,Model);
      }else{
        _showDialogError();
      }
  }

  void _showDialog(var name,contact,model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Owner's Information", textAlign: TextAlign.center),
          content: new Text(' Name : $name \n Contact Number : $contact \n Vehicle Model : $model'),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Owner's Information", textAlign: TextAlign.center),
          content: new Text('No Data Available'),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: <Widget>[
          Form(
            key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Plate Number'
                    ),
                    onChanged: (text) {
                      _setId(text);
                    },
                  )
                ),

                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                    onPressed: (){
                      _read();
                    },
                    child: const Text('Retrieve'),
                  )
                ),

                ],
            )
          ),
        ]),
      ),
    );
  }
}