import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../providers/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _user = FirebaseAuth.instance.currentUser!.uid;
    var route = Provider.of<Routes>(context);
    var routesData = Provider.of<Routes>(context).items;

    Widget routeCard(int start, int finish, int routeNumber) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              start == finish + 1
                  ? const Text('Dia de encuesta')
                  : Text('Dia $start de $finish'),
              Text(routesData[routeNumber].title),
              Image.asset(routesData[routeNumber].image)
            ],
          ),
        ),
      );
    }

    Widget currentActivity(int daysSince, DateTime startDate) {
      final int totalDays = routesData[0].days + routesData[1].days + 2;

      if (daysSince < 0) {
        return Text(
            'Aún no tiene habilitado el ingreso a la plataforma. Regrese el ${DateFormat('d/M/y').format(startDate)}');
      }
      if (daysSince >= 0 && daysSince <= routesData[0].days) {
        return routeCard(daysSince + 1, routesData[0].days, 0);
        return Text('Dia $daysSince de ${routesData[0].days}');
      }
      if (daysSince > routesData[0].days && daysSince < totalDays) {
        final int start = daysSince - (routesData[0].days + 1);
        return routeCard(start + 1, routesData[1].days, 1);
      }
      return Text(
        'Ha completado todas las actividades del día. Felicidades!',
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }

    print(_user);

    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(_user).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text("Ha ocurrido un error. Intente mas tarde."));
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(child: Text("No existe información"));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            final String username = data['username'];
            final DateTime startDate = data['startdate'].toDate();

            routesData[0].startdate = DateUtils.dateOnly(startDate);
            routesData[1].startdate =
                DateUtils.dateOnly(startDate).add(const Duration(days: 11));
            route.addListener(() {});

            final daysSince =
                DateTime.now().difference(DateUtils.dateOnly(startDate)).inDays;

            print(startDate);
            print(DateUtils.dateOnly(startDate));
            print(daysSince);

            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              //color: Colors.black,
              child: Column(
                children: [
                  Text(
                    'Bienvenido, $username',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  currentActivity(daysSince, startDate),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        });

    return const Center(
      child: Text('Pantalla principal'),
    );
  }
}
