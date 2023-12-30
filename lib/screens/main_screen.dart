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
                        'Día de cuestionarios',
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
        return Text('Aún no tienes habilitado el ingreso a la plataforma. '
            'Regresa el ${DateFormat('d/M/y').format(startdate)}');
      }
      if (daysSince >= 0 && daysSince < route0.days) {
        return routeCard(daysSince + 1, route0.days, 0);
      }
      if (daysSince >= route0.days && daysSince < totalDays) {
        final int start = daysSince - route0.days;
        return routeCard(start + 1, route1.days, 1);
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
      return SingleChildScrollView(
        child: Container(
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
              const SizedBox(height: 30),
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
                              'Antes de comenzar con las actividades de relajación queremos darte la bienvenida a ReFocus. '
                              'Día a día nos enfrentamos a diferentes eventos estresantes, afortunadamente existen estrategias que podemos aprender para manejar la respuesta emocional que experimentamos ante un evento dado. '
                              'Nuestra aplicación ha sido cuidadosamente diseñada para proporcionarte de herramientas y técnicas que te ayudarán a sobrellevar estas situaciones y a regular tu estado emocional.\n\n'
                              'La aplicación cuenta con distintas rutas de una duración determinada. Cada ruta se habilita luego de terminar la ruta anterior.\n'
                              'Cada ruta contiene múltiples actividades centradas alrededor de una temática general. Se habilita una actividad nueva por día, y en el último día de la ruta se habilitan cuestionarios para que usted realice. '
                              'Estos cuestionarios son necesarios para hacer un seguimiento de bienestar luego de finalizar la ruta, para luego compararlo con los cuestionarios iniciales que usted realizó al registrarse.\n\n'
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
