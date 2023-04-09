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
    DateTime startdate = path.startdate;
    List<Activity> activities = path.activities;
    List<Survey>? surveys = path.surveys;
    int days = activities.length;
    int survDays = surveys!.length;
    String pathtitle = path.title;

    var now = DateTime.now();

    for (int i = 1; i <= days; i++) {
      if (i <= now.difference(startdate).inDays + 1) {
        list.add(ActivityElement(path: pathtitle, activity: activities[i - 1]));
      } else {
        list.add(ActivityElement(
          path: pathtitle,
          activity: activities[i - 1],
          enable: false,
        ));
      }
    }

    for (int i = 1; i <= survDays; i++) {
      if (now.difference(startdate).inDays >= days) {
        list.add(SurveyElement(path: pathtitle, survey: surveys[i - 1]));
      } else {
        list.add(SurveyElement(
          path: pathtitle,
          survey: surveys[i - 1],
          enable: false,
        ));
      }
    }

    // for (int i = 1; i <= dias; i++) {
    //   if (i <= ingreso) {
    //     list.add(DayElement());
    //   } else {
    //     list.add(const DayElement(
    //       enable: false,
    //     ));
    //   }
    // }

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
      appBar: AppBar(
        title: Text(loadedPath.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: tipoBoton(loadedPath),
      ),
    );
  }
}
