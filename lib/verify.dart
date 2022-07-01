import 'dart:convert';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vehicle_management/retrieve.dart';
import 'package:vehicle_management/route.dart';
import 'retrieve.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  var _matricnum;

  void _setMatricnum(String text) {
    setState(() {
      _matricnum = text;
    });
  }
  void verify(var no) async{
    var info = firestore.collection('owners');
      var docSnapshot = await info.doc(no).get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        var mnum = data?['MatricNumber'];
        if (mnum == _matricnum) {
          Navigator.pushNamed(context, Routes.update);
        }else{
          String e = 'Wrong Matric Number....Access denied';
          _showDialogError(e);
        }
        //_showDialog(Name,Contact,Model);
      }else{
        String e = 'Error';
        _showDialogError(e);
    }
  }

  void _showDialogError(var status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Owner's Information", textAlign: TextAlign.center),
          content: new Text(status),
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
    Vehicle v = ModalRoute.of(context)!.settings.arguments as Vehicle;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
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
                Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text('Regno  : ${v.regno}'),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text('Enter Matric Number to Verify'),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Matric Number'
                    ),
                    onChanged: (text) {
                      _setMatricnum(text);
                    },
                  )
                ),

                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                    onPressed: (){
                      verify(v.regno);
                    },
                    child: const Text('Submit'),
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