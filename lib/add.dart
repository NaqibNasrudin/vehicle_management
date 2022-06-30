import 'dart:convert';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'route.dart';

import 'package:flutter/material.dart';


class RegisterVehicle extends StatefulWidget {
  const RegisterVehicle({Key? key}) : super(key: key);

  @override
  _RegisterVehicleState createState() => _RegisterVehicleState();
}

class _RegisterVehicleState extends State<RegisterVehicle> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNo = '';
  String _regNo = '';
  String _model = '';
  String _matric = '';
  String _room = '';

  void _setName(String name) {
    setState(() {
      _name = name;
    });
  }

  void _setPhoneNo(String phoneNo) {
    setState(() {
      _phoneNo = phoneNo;
    });
  }

  void _setRegNo(String regNo) {
    _regNo = regNo;
  }

  void _setModel(String model) {
    _model = model;
  }

  void _setMatricNumber(String text) {
    _matric = text;
  }

  void _setRoomNumber(String text) {
    _room = text;
  }

  void _create() async {
    try {
      await firestore.collection('owners').doc(_regNo).set({
        'Name': _name,
        'MatricNumber': _matric,
        'RoomNumber': _room, 
        'Contact': _phoneNo,
        'VehicleModel' : _model,
      });
    } catch (e) {
      print(e);
    }
  }

  void _showDialog(var name1,name2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("BMI Status", textAlign: TextAlign.center),
          content: new Text(' First Name : $name1 \n Last Name : $name2'),
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
  void _showDialogError(var status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("BMI Status", textAlign: TextAlign.center),
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Vehicle'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your name';
                      }
                    },
                    onChanged: (input) {
                      _setName(input);
                    },
                    keyboardType: TextInputType.text,
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Matric Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your matric number';
                      }
                    },
                    onChanged: (input) {
                      _setMatricNumber(input);
                    },
                    keyboardType: TextInputType.text,
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Room Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your room number';
                      }
                    },
                    onChanged: (input) {
                      _setRoomNumber(input);
                    },
                    keyboardType: TextInputType.text,
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your phone number';
                      }
                    },
                    onChanged: (input) {
                      _setPhoneNo(input);
                    },
                    keyboardType: TextInputType.number,
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Registration Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your vehicle registration number';
                      }
                    },
                    onChanged: (input) {
                      _setRegNo(input);
                    },
                    keyboardType: TextInputType.text,
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Model',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your car model';
                      }
                    },
                    onChanged: (input) {
                      _setModel(input);
                    },
                    keyboardType: TextInputType.text,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _create();
                          }
                        },
                        child: const Text('Upload'),
                      )),
                ],
              ),
            )
          ],
        )));
  }
}
