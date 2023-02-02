import 'package:flutter/material.dart';

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
    final id = activity.id;
    return Scaffold(
      appBar: AppBar(
        title: Text(path),
      ),
      body: Center(
        child: Text('Actividad $id'),
      ),
    );
  }
}
