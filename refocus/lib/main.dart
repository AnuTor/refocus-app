import 'package:flutter/material.dart';

import './screens/select_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ReFocus',
      home: SelectRoute(),
    );
  }
}
