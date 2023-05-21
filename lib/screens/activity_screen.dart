import 'package:flutter/material.dart';

import './player_screen.dart';
import '../providers/activity.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = '/activity-screen';
  const ActivityScreen({Key? key}) : super(key: key);

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              activity.text,
              style: Theme.of(context).textTheme.bodyLarge,
              //textAlign: TextAlign.justify
            ),
          ),
          const SizedBox(height: 20),
          activity.audio
              ? TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => PlayerScreen(activity: activity))
                    )
                  )
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Comenzar'),
              )
              : const SizedBox.shrink(),
        ]),
      ),
    );
  }
}
