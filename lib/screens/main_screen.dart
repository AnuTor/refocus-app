import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = Provider.of<Routes>(context);
    var routesData = routes.items;
    var startdate = routes.startdate;
    var username = routes.username;
    final daysSince =
        DateTime.now().difference(DateUtils.dateOnly(startdate)).inDays;

    Widget routeCard(int start, int finish, int routeNumber) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              start == finish + 1
                  ? const Text(
                      'Dia de encuesta',
                      style: TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                    )
                  : Text(
                      'Día $start de $finish',
                      style:
                          const TextStyle(fontSize: 22, fontFamily: 'Roboto'),
                    ),
              Text('Recorrido de ${routesData[routeNumber].title}',
                  style: const TextStyle(
                      fontSize: 22, color: Colors.grey, fontFamily: 'Roboto')),
              Image.asset(routesData[routeNumber].image),
            ],
          ),
        ),
      );
    }

    Widget currentActivity(int daysSince, DateTime startdate) {
      final int totalDays = routesData[0].days + routesData[1].days + 2;
      if (daysSince < 0) {
        return Text(
            'Aún no tiene habilitado el ingreso a la plataforma. Regrese el ${DateFormat('d/M/y').format(startdate)}');
      }
      if (daysSince >= 0 && daysSince <= routesData[0].days) {
        return routeCard(daysSince + 1, routesData[0].days, 0);
      }
      if (daysSince > routesData[0].days && daysSince < totalDays) {
        final int start = daysSince - (routesData[0].days + 1);
        return routeCard(start + 1, routesData[1].days, 1);
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
        //color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido, $username',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            currentActivity(daysSince, startdate),
          ],
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
