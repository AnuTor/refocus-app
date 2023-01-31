import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';
import '../widgets/activity_element.dart';

class PathScreen extends StatelessWidget {
  static const routeName = '/path-screen';

  const PathScreen({ Key? key }) : super(key: key);

  List<Widget> tipoBoton(int dias, DateTime ingreso) {
    List<Widget> list = [];

    var now = DateTime.now();

    for (int i = 1; i <= dias; i++) {
      if (i <= now.difference(ingreso).inDays + 1) {
        list.add(ActivityElement(content: Text(i.toString())));
      } else {
        list.add(const ActivityElement(
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
    final routeId =
        ModalRoute.of(context)!.settings.arguments as int; // is the id!
    final loadedProduct = Provider.of<Routes>(
      context,
      listen: false,
    ).findById(routeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.titulo),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: tipoBoton(loadedProduct.dias, loadedProduct.ingreso),
      ),
    );
  }
}
