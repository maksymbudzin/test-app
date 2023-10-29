import 'package:flutter/material.dart';
import 'package:olearis_test_task/screens/login_screen.dart';

void main() => runApp(OlearisApp());

class OlearisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}




