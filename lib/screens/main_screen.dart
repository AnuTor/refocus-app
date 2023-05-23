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

    Widget buildCardContent(
        int start, int finish, int routeNumber, bool isSmallScreen) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: InkWell(
          onTap: routeNumber == 0
            ? () => {
              Navigator.of(context)
                .pushNamed(PathScreen.routeName, arguments: 1)
            }
            : () => {
              Navigator.of(context)
                .pushNamed(PathScreen.routeName, arguments: 2)
            },
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                start == finish
                  ? const Text(
                    'Dia de cuestionarios',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  )
                  : Text(
                    'Día $start de $finish',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22),
                  ),
                Text(
                  'Recorrido de ${routesData[routeNumber].title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.grey,
                  ),
                ),
                if (isSmallScreen)
                  Expanded(child: Image.asset(routesData[routeNumber].image))
                else
                  Image.asset(routesData[routeNumber].image),
              ],
            ),
          ),
        ),
      );
    }

    Widget routeCard(
        int start, int finish, int routeNumber, bool isSmallScreen) {
      final Widget cardContent = isSmallScreen
        ? Expanded(child:
          buildCardContent(start, finish, routeNumber, isSmallScreen),
        )
        : buildCardContent(start, finish, routeNumber, isSmallScreen);
      return cardContent;
    }

    Widget currentActivity(bool isSmallScreen) {
      final DateTime currentDate = DateTime.now();
      final DateTime currentDateOnly = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day
      );
      final daysSince =
        currentDateOnly.difference(DateUtils.dateOnly(startdate)).inDays;
      final route0 = routesData[0];
      final route1 = routesData[1];
      final int totalDays = route0.days + route1.days;
      if (daysSince < 0) {
        return Text(
          'Aún no tiene habilitado el ingreso a la plataforma. '
          'Regrese el ${DateFormat('d/M/y').format(startdate)}'
        );
      }
      if (daysSince >= 0 && daysSince < route0.days) {
        return routeCard(daysSince + 1, route0.days, 0, isSmallScreen);
      }
      if (daysSince >= route0.days && daysSince < totalDays) {
        final int start = daysSince - route0.days;
        return routeCard(start + 1, route1.days, 1, isSmallScreen);
      }
      return Text(
        'Felicidades! Has completado las 2 semanas de actividades. '
        'De todos modos quedan habilitados todos los ejercicios '
        'por si quieres seguir practicando.',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      );
    }

    if (username != "") {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        bool isSmallScreen = constraints.maxHeight < 400;
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
              currentActivity(isSmallScreen),
            ],
          ),
        );
      });
    }
    return const Center(child: CircularProgressIndicator());
  }
}
