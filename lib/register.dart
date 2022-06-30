import 'package:firebase_core/firebase_core.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_management/add.dart';
import 'package:vehicle_management/retrieve.dart';
import 'route.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  var mail,pass;

  void _setEmail(String text){
    setState(() {
      mail = text;
    });
  }

  void _setPass(String text){
    setState(() {
      pass = text;
    });
  }

  void _register() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: pass
      );
      login();
    }catch(e){
      print(e);
    }
  }
  void login() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: pass
      );

      /*User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        await user.sendEmailVerification();
      }*/

    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                      labelText: 'email'
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }, 
                    onChanged: (text) {
                      _setEmail(text);
                    },
                  )
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }, 
                    onChanged: (text) {
                      _setPass(text);
                    },
                  )
                ),

                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
                    },
                    child: const Text('Register'),
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
