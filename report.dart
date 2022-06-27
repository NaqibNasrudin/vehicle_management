import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final _formKey = GlobalKey<FormState>();

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

                  const Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Report',
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
                  ),

                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('Submit'),
                      )),
                ],
              ),
            )
          ],
        )));
  }
}
