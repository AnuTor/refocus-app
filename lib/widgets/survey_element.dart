import 'package:flutter/material.dart';

import '../screens/survey_screen.dart';
import '../providers/survey.dart';

class SurveyElement extends StatelessWidget {
  final String path;
  final Survey survey;
  final bool enable;

  const SurveyElement({
    Key? key,
    required this.path,
    required this.survey,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        shape: const CircleBorder(),
        backgroundColor: Colors.deepOrange);

    return ElevatedButton(
      onPressed: enable
          ? () => {
                Navigator.of(context).pushNamed(
                  SurveyScreen.routeName,
                  arguments: {'path': path, 'survey': survey},
                )
              }
          : null,
      style: style,
      child: enable ? Text(survey.id.toString()) : const Icon(Icons.lock),
    );
  }
}
