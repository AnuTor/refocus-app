import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
