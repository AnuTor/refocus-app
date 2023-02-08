import 'package:flutter/material.dart';

import '../providers/activity.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = '/activity-screen';

  const ActivityScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        //style: Theme.of(context).textTheme.title,
      ),
    );
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                activity.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                activity.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                activity.text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ]
        ),
      )
    );
  }
}
