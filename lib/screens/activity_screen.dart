import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './player_screen.dart';
import '../providers/activity.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = '/activity-screen';
  const ActivityScreen({Key? key}) : super(key: key);

  void _activityDone(String path, Activity activity) async {
    final user = FirebaseAuth.instance.currentUser!;
    final activityDone = await FirebaseFirestore.instance
        .collection('activitiesDone')
        .where('UserID', isEqualTo: user.uid)
        .where('path', isEqualTo: path)
        .where('activity', isEqualTo: activity.title)
        .get();
    if (activityDone.docs.isEmpty) {
      FirebaseFirestore.instance.collection('activitiesDone').add({
        'firstDone': Timestamp.now(),
        'UserID': user.uid,
        'path': path,
        'activity': activity.title
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final path = routeArgs['path'] as String;
    final activity = routeArgs['activity'] as Activity;
    return Scaffold(
      appBar: AppBar(
        title: Text(path),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(activity.image, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Text(
              activity.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          activity.reversed
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      "Comienza escuchando el audio de introducción que preparamos para vos.",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,  
                    ),
                    const SizedBox(height: 15),
                    buttonActivity(activity, context, path),
                    //const SizedBox(height: 15),
                  ],
                ),
              )
              : contentActivity(activity, context),
          const SizedBox(height: 20),
          activity.reversed
              ? Column(
                  children: [
                    contentActivity(activity, context),
                  ],
                )
              : buttonActivity(activity, context, path),
          const SizedBox(height: 15),
        ]),
      ),
    );
  }

  Container contentActivity(Activity activity, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        activity.text,
        style: Theme.of(context).textTheme.bodyLarge,
        //textAlign: TextAlign.justify
      ),
    );
  }

  ButtonStyleButton buttonActivity(
    Activity activity, BuildContext context, String path) {
    return activity.audio
      ? TextButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => PlayerScreen(
                        activity: activity,
                        path: path,
                      ))))
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Escuchar'),
            Icon(Icons.arrow_right, size: 35),
          ],
        ),
      )
      : TextButton(
        onPressed: () => {
          _activityDone(path, activity),
          Future.delayed(const Duration(milliseconds: 300)).then((_) {
            Navigator.of(context).pop();
          })
        },
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Completar actividad'),
          ],
        )
      );
  }
}
