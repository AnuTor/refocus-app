import 'package:flutter/material.dart';

import '../widgets/day_element.dart';

class DayScreen extends StatelessWidget {
  final int dias;
  final DateTime ingreso;
  final String titulo;

  const DayScreen(
      {Key? key,
      required this.titulo,
      required this.dias,
      required this.ingreso})
      : super(key: key);

  List<Widget> tipoBoton(int dias, DateTime ingreso) {
    List<Widget> list = [];

    var now = DateTime.now();

    for (int i = 1; i <= dias; i++) {
      if (i <= now.difference(ingreso).inDays + 1) {
        list.add(DayElement(content: Text(i.toString())));
      } else {
        list.add(const DayElement(
          content: Icon(Icons.lock),
          enable: false,
        ));
      }
    }

    // for (int i = 1; i <= dias; i++) {
    //   if (i <= ingreso) {
    //     list.add(DayElement(content: Text(i.toString())));
    //   } else {
    //     list.add(const DayElement(
    //       content: Icon(Icons.lock),
    //       enable: false,
    //     ));
    //   }
    // }

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
        children: tipoBoton(dias, ingreso),
      ),
    );
  }
}
