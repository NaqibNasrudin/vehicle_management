import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_management/add.dart';
import 'package:vehicle_management/admins.dart';
import 'package:vehicle_management/login.dart';
import 'package:vehicle_management/register.dart';
import 'package:vehicle_management/report.dart';
import 'package:vehicle_management/retrieve.dart';
import 'package:vehicle_management/update.dart';
import 'route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDV_7mGW5t_XH6-znobWsA6BXsQpBPhnns",
      appId: "1:76771865365:android:c2b16b6d583404b36bef1c",
      messagingSenderId: "76771865365",
      projectId: "vehicle-management-cb792",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        //scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Vehicle Management'),
      routes: {
        Routes.retrieve: (context) => RetrievePage(),
        Routes.newuser: (context) => RegisterVehicle(),
        Routes.login: (content) => LoginPage(),
        Routes.admin: (context) => AdminRetrievePage(),
        Routes.update:(context) => UpdateVehicle(),
        Routes.report:(context) => Report(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.retrieve);
              },
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
              onPressed: (){
                  Navigator.pushNamed(context, Routes.login);
              },
              child: const Text('LOGIN'),
            )
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/applogo.png'
            ),
            
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.newuser);
                },
                child: const Text('Vehicle Registration'),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.update);
                },
                child: const Text('Update'),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.report);
                },
                child: const Text('Report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
