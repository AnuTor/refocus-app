import 'package:flutter/material.dart';

import '../providers/questions.dart';
import '../providers/survey.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/survey-screen';
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();

  List<String> _questionAnswer = [];

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final path = routeArgs['path'] as String;
    final survey = routeArgs['survey'] as Survey;

    // _questionAnswer = List<String>.filled(survey.questions.length, 'respuesta');

    List<Widget> form(
        Question question, List<String> options, List<String> answer) {
      setState(() {
        answer.add('Respuesta');
      });
      List<Widget> list = [];
      list.add(Text(question.question));
      for (String ans in options) {
        list.add(RadioListTile(
          title: Text(ans),
          value: ans,
          groupValue: answer.last,
          onChanged: (value) {
            setState(() {
              answer.last = value!;
            });
          },
        ));
      }

      list.add(const SizedBox(height: 16.0));

      return list;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(path),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    survey.testName,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    survey.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (var e in survey.questions)
                            ...form(e, survey.options, _questionAnswer),
                          /* Text(survey.questions[0].question),
                          RadioListTile(
                            title: Text(survey.options[0]),
                            value: survey.options[0],
                            groupValue: _questionAnswer[0],
                            onChanged: (value) {
                              setState(() {
                                _questionAnswer[0] = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(survey.options[1]),
                            value: survey.options[1],
                            groupValue: _questionAnswer[0],
                            onChanged: (value) {
                              setState(() {
                                _questionAnswer[0] = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(survey.options[2]),
                            value: survey.options[2],
                            groupValue: _questionAnswer[0],
                            onChanged: (value) {
                              setState(() {
                                _questionAnswer[0] = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(survey.options[3]),
                            value: survey.options[3],
                            groupValue: _questionAnswer[0],
                            onChanged: (value) {
                              setState(() {
                                _questionAnswer[0] = value!;
                              });
                            },
                          ), */
                          Center(
                              child: ElevatedButton(
                                  child: Text('Submit'),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Do something with the survey answers
                                    }
                                  }))
                        ]),
                  ),
                ],
              ),
            )));
  }
}
