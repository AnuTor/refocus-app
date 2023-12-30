import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refocus/providers/survey.dart';
import 'package:refocus/widgets/survey_element.dart';

import '../providers/activity.dart';
import '../providers/path.dart';
import '../providers/routes.dart';
import '../widgets/activity_element.dart';
import './activity_screen.dart';

class PathScreen extends StatelessWidget {
  static const routeName = '/path-screen';
  const PathScreen({Key? key}) : super(key: key);

  List<Widget> tipoBoton(context, Path path) {
    List<Widget> list = [];
    DateTime startdate = path.startdate as DateTime;
    int pathLenght = path.days;
    List<Activity> activities = path.activities;
    List<Survey>? surveys = path.surveys ?? [];
    int activitiesDays = activities.length;
    int survDays = surveys.length;
    String pathtitle = path.title;
    DateTime now = DateUtils.dateOnly(DateTime.now());
    double spacing = 20;

    list.add(SizedBox(
      height: spacing,
    ));

    for (int i = 0; i < activitiesDays; i++) {
      if (i == 0) {
        list.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ActivityScreen.routeName,
                    arguments: {'path': pathtitle, 'activity': activities[0]},
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  activities[0].title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (i < now.difference(startdate).inDays + 2) {
        list.add(ActivityElement(path: pathtitle, activity: activities[i]));
      } else {
        list.add(ActivityElement(
          path: pathtitle,
          activity: activities[i],
          enable: false,
        ));
      }
      list.add(SizedBox(
        height: spacing,
      ));
    }
    for (int i = 0; i < survDays; i++) {
      if (now.difference(startdate).inDays + 1 >= pathLenght) {
        list.add(
          SurveyElement(
            path: pathtitle,
            survey: surveys[i],
            num: i + 1,
          ),
        );
      } else {
        list.add(
          SurveyElement(
            path: pathtitle,
            survey: surveys[i],
            num: i + 1,
            enable: false,
          ),
        );
      }
      list.add(SizedBox(
        height: spacing,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final pathId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedPath = Provider.of<Routes>(
      context,
      listen: false,
    ).findById(pathId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedPath.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(loadedPath.image, fit: BoxFit.fitWidth),
            Text(loadedPath.title,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(
              loadedPath.subtitle,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...tipoBoton(context, loadedPath),
          ],
        ),
      ),
    );
  }
}
