import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';
import '../widgets/route_element.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesData = Provider.of<Routes>(context).items;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ChangeNotifierProvider.value(
          value: routesData[0],
          child: const RouteElement(),
        ),
        ChangeNotifierProvider.value(
          value: routesData[1],
          child: const RouteElement(),
        ),
        ChangeNotifierProvider.value(
          value: routesData[2],
          child: const RouteElement(),
        ),
      ]
    );
  }
}
