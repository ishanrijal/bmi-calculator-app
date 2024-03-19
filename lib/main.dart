import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import './pages//home.dart';

/// This is the simple dart application for the calculation of BMI. It has interactive and easy to use UI.

/// Flutter application entry point.
void main() {
  runApp(const MyApp());
}

/// The root widget of the applicaiton
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// Stored the homepage into another file to make the main.dart clean.
      home: Home(),
    );
  }
}
