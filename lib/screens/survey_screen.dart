import 'package:flutter/material.dart';

import '../providers/survey.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/survey-screen';
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();

  String _question1Answer = 'Respuesta 1';
  String _question2Answer = 'Respuesta 2';
  String _question3Answer = 'Respuesta 3';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final path = routeArgs['path'] as String;
    final survey = routeArgs['survey'] as Survey;
    return Scaffold(
        appBar: AppBar(
          title: Text(path),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
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
                          Text('Question 1:'),
                          RadioListTile(
                            title: Text('Option A'),
                            value: 'Option A',
                            groupValue: _question1Answer,
                            onChanged: (value) {
                              setState(() {
                                _question1Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option B'),
                            value: 'Option B',
                            groupValue: _question1Answer,
                            onChanged: (value) {
                              setState(() {
                                _question1Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option C'),
                            value: 'Option C',
                            groupValue: _question1Answer,
                            onChanged: (value) {
                              setState(() {
                                _question1Answer = value!;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          Text('Question 2:'),
                          RadioListTile(
                            title: Text('Option A'),
                            value: 'Option A',
                            groupValue: _question2Answer,
                            onChanged: (value) {
                              setState(() {
                                _question2Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option B'),
                            value: 'Option B',
                            groupValue: _question2Answer,
                            onChanged: (value) {
                              setState(() {
                                _question2Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option C'),
                            value: 'Option C',
                            groupValue: _question2Answer,
                            onChanged: (value) {
                              setState(() {
                                _question2Answer = value!;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          Text('Question 3:'),
                          RadioListTile(
                            title: Text('Option A'),
                            value: 'Option A',
                            groupValue: _question3Answer,
                            onChanged: (value) {
                              setState(() {
                                _question3Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option B'),
                            value: 'Option B',
                            groupValue: _question3Answer,
                            onChanged: (value) {
                              setState(() {
                                _question3Answer = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Option C'),
                            value: 'Option C',
                            groupValue: _question3Answer,
                            onChanged: (value) {
                              setState(() {
                                _question3Answer = value!;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          Center(
                              child: ElevatedButton(
                                  child: Text('Submit'),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Do something with the survey answers
                                    }
                                  }))
                        ])),
              ],
            )));
  }
}
