import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReFocus',
      home: Scaffold(
        appBar: AppBar(title: const Text('ReFocus')),
        body: const Center(
          child: Text('Vista inicial de la aplicación'),
        ),
      ),
    );
  }
}
