import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';
import '../providers/activity.dart';
import './path_screen.dart';
import './activity_screen.dart';

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
                    ? Text(
                        'Día de cuestionario',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    : Text(
                        'Día $start de $finish',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                Text(
                  'Recorrido de ${routesData[routeNumber].title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.grey,
                  ),
                ),
                Image.asset(routesData[routeNumber].image)
              ],
            ),
          ),
        ),
      );
    }

    Widget currentActivity() {
      final DateTime currentDate = DateTime.now();
      final DateTime currentDateOnly =
          DateTime(currentDate.year, currentDate.month, currentDate.day);
      final daysSince =
          currentDateOnly.difference(DateUtils.dateOnly(startdate)).inDays;
      final route0 = routesData[0];
      final route1 = routesData[1];
      final int totalDays = route0.days + route1.days;
      if (daysSince < 0) {
        return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        elevation: 10,
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aún no tienes habilitado el ingreso a la plataforma. '
                  'Regresa el ${DateFormat('d/M/y').format(startdate)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Image.asset('assets/images/time.png'),
              ],
            ),
          ),
      );
      }
      if (daysSince >= 0 && daysSince < route0.days) {
        return routeCard(daysSince + 1, route0.days, 0);
      }
      if (daysSince >= route0.days && daysSince < totalDays) {
        final int start = daysSince - route0.days;
        return routeCard(start + 1, route1.days, 1);
      }
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        elevation: 10,
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '¡Felicidades! Has completado todas las actividades. '
                  'Las mismas quedarán habilitadas por si quieres volver a realizarlas.',
                  textAlign: TextAlign.center,
                  //style: Theme.of(context).textTheme.titleLarge,
                  style: TextStyle(
                    fontSize: 19,
                    //fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(height: 8),
                Image.asset('assets/images/choque.png'),
              ],
            ),
          ),
      );
    }

    if (username != "") {
      return SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                '¡Bienvenido/a $username!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 15),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                elevation: 10,
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).pushNamed(
                      ActivityScreen.routeName,
                      arguments: {
                        'path': 'Presentación',
                        'activity': Activity(
                          id: 1,
                          title: 'Presentación',
                          subtitle: 'Introducción a ReFocus',
                          image: 'assets/images/welcome.png',
                          text:
                              'Antes de comenzar con las actividades que preparamos para vos queremos darte la bienvenida a ReFocus. '
                              'Día a día nos enfrentamos a diferentes eventos estresantes, afortunadamente existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. '
                              'Nuestra aplicación ha sido cuidadosamente diseñada para proporcionarte de herramientas y técnicas que te ayudarán a sobrellevar estas situaciones y a regular tu estado emocional.\n\n'
                              'La app está pensada para que comiences a realizar las actividades desde el primer día en que creas tu cuenta y para que puedas realizar una actividad al día. Cuenta con 2 rutas de una semana de duración cada una, la segunda ruta se habilitará una vez finalizada la primera semana del programa. '
                              'Cada recorrido contiene actividades, que se irán habilitando día a día, centradas alrededor de una temática general. En el último día de cada recorrido se habilitarán cuestionarios múltiple opción que deberás completar para que podamos realizar el seguimiento.\n\n'
                              'Te invitamos a escuchar un breve audio de presentación en el que profundizamos sobre los objetivos y contenidos de la aplicación. Que lo disfrutes.',
                          audio: true,
                          audiofile: '1_intro.m4a',
                        ),
                      },
                    ),
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 5, right: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Introducción a ReFocus',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Image.asset('assets/images/welcome.png'),
                      ],
                    ),
                  ),
                ),
              ),
              currentActivity(),
            ],
          ),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
