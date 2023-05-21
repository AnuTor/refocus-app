import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';
import '../screens/path_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = Provider.of<Routes>(context);
    var routesData = routes.items;
    var startdate = routes.startdate;
    var username = routes.username;

    Widget routeCard(int start, int finish, int routeNumber) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: InkWell(
          onTap: routeNumber == 0
            ? () => {Navigator.of(context)
                .pushNamed(PathScreen.routeName, arguments: 1)}
            : () => {Navigator.of(context)
                .pushNamed(PathScreen.routeName, arguments: 2)},
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                start == finish
                  ? const Text(
                    'Dia de encuesta',
                    style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                  )
                  : Text(
                    'Día $start de $finish',
                    style:
                        const TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                  ),
                Text(
                  'Recorrido de ${routesData[routeNumber].title}',
                  style: const TextStyle(
                    fontSize: 22, color: Colors.grey, fontFamily: 'Roboto'
                  ),
                ),
                Image.asset(routesData[routeNumber].image),
              ],
            ),
          ),
        ),
      );
    }

    Widget currentActivity() {
      final daysSince =
          DateTime.now().difference(DateUtils.dateOnly(startdate)).inDays;
      final route0 = routesData[0];
      final route1 = routesData[1];
      final int totalDays = route0.days + route1.days + 2;
      if (daysSince < 0) {
        return Text(
          'Aún no tiene habilitado el ingreso a la plataforma. '
          'Regrese el ${DateFormat('d/M/y').format(startdate)}'
        );
      }
      if (daysSince >= 0 && daysSince < route0.days) {
        return routeCard(daysSince + 1, route0.days, 0);
      }
      if (daysSince >= route0.days && daysSince < totalDays) {
        final int start = daysSince - route0.days;
        return routeCard(start + 1, route1.days, 1);
      }
      return Text(
        'Ha completado todas las actividades. Felicidades!',
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }

    if (username != "") {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido, $username',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            currentActivity(),
          ],
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
