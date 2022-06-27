import 'package:final_project/report.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phoneNo = '';
  String _regNo = '';
  String _model = '';

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
                  //const Text('Register Vehicle'),
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
