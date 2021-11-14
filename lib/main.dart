import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/login.dart';
import 'package:flutter_app/widgets/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryIconTheme: IconThemeData(color: Colors.black)),
      home: Login(),
    );
  }
}
