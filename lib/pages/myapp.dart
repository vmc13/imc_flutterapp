import 'package:flutter/material.dart';
import '../controllers/myIMC.dart';
import '../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple, appBarTheme: AppBarTheme(elevation: 0)),
      home: MyIMC(),
    );
  }
}