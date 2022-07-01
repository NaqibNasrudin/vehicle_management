import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_management/route.dart';



class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String _regNo = '';
  String _model = '';
  String _report = '';

  void _setRegNo(String regNo) {
    _regNo = regNo;
  }

  void _setModel(String model) {
    _model = model;
  }

  void _setReport(String report) {
    _report = report;
  }

  void _update() async {
  try {
    var info = firestore.collection('owners');
    var docSnapshot = await info.doc(_regNo).get();
    if (docSnapshot.exists){
    firestore.collection('owners').doc(_regNo).update({
      'Report': _report,
    });
    var success = 'Successfull';
    _showDialog(success);
    }else{
      print('No Data');
    };
    
  } catch (e) {
    print(e);
  }

}
void _showDialog(var status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Report Submitted", textAlign: TextAlign.center),
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
          title: const Text('Report'),
        ),
        body: Center(
          child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0),
                  child : TextFormField(
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
                  )),

                  Padding(padding: EdgeInsets.all(20.0),
                  child:TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Report',
                      //border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your car model';
                      }
                    },
                    onChanged: (input) {
                      _setReport(input);
                    },
                    keyboardType: TextInputType.text,
                  )),

                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _update();
                          }
                        },
                        child: const Text('SUBMIT'),
                      )),
                ],
              ),
            )
          ],
        )));
  }
}