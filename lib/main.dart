import 'package:flutter/material.dart';
import 'package:myportfolio/UI/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sajid Hussain',
      debugShowCheckedModeBanner: true,
      home: Home(),
    );
  }
}
