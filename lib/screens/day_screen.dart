import 'package:flutter/material.dart';

import '../widgets/day_element.dart';

class DayScreen extends StatelessWidget {
  final int dias;
  final int diasActivos;
  final String titulo;

  const DayScreen(
      {Key? key,
      required this.titulo,
      required this.dias,
      required this.diasActivos})
      : super(key: key);

  List<Widget> tipoBoton(int dias, int diasActivos) {
    List<Widget> list = [];

    for (int i = 1; i <= dias; i++) {
      if (i <= diasActivos) {
        list.add(DayElement(content: Text(i.toString())));
      } else {
        list.add(const DayElement(content: Icon(Icons.lock)));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: tipoBoton(dias, diasActivos),
      ),
    );
  }
}
