import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refocus/providers/survey.dart';
import 'package:refocus/widgets/survey_element.dart';

import '../providers/activity.dart';
import '../providers/path.dart';
import '../providers/routes.dart';
import '../widgets/activity_element.dart';

class PathScreen extends StatelessWidget {
  static const routeName = '/path-screen';
  const PathScreen({Key? key}) : super(key: key);

  List<Widget> tipoBoton(Path path) {
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
      if (i < now.difference(startdate).inDays + 1) {
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
          ChangeNotifierProvider.value(
            value: surveys[i],
            child: SurveyElement(
              path: pathtitle,
              survey: surveys[i],
              num: i + 1,
            ),
          ),
        );
      } else {
        list.add(
          ChangeNotifierProvider.value(
            value: surveys[i],
            child: SurveyElement(
              path: pathtitle,
              survey: surveys[i],
              num: i + 1,
              enable: false,
            ),
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
            Text(
              loadedPath.subtitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ...tipoBoton(loadedPath),
          ],
        ),
      ),
    );
  }
}
