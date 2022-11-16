import 'package:flutter/material.dart';
import 'package:gameporium/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Contants.primaryColor,
      ),
    );
  }
}