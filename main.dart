import 'package:final_project/register.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      //home: const MyHomePage(title: 'Mahallah Ali Vehicle Management System'),
    initialRoute: Routes.register,
        routes: {
          Routes.register: (context) => const Register(),
          //Routes.report: (context) => const Report(),
        }
    );
  }
}

class Routes {
  static const register = '/Register';
  static const report = '/Report';
}

