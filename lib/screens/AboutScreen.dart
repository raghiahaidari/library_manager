import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      ),
      body: Center(
        child: Text(
          'Application de gestion de bibliothèque.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
