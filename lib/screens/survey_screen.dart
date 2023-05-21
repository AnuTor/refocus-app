import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  Map<String, String> questionAnswer = {};

  List<Widget> form(
    Question question,
    List<String> options,
    Map<String, String> answer
  ) {
    List<Widget> list = [];
    String questionNum;
    if (question.id < 10) {
      questionNum = 'Q0${question.id.toString()}';
    } else {
      questionNum = 'Q${question.id.toString()}';
    }
    answer[questionNum] ??= 'Respuesta';
    list.add(Text(question.question));
    for (String ans in options) {
      list.add(RadioListTile(
        title: Text(ans),
        value: ans,
        groupValue: answer[questionNum],
        onChanged: (value) {
          setState(() {
            answer[questionNum] = value!;
          });
        },
      ));
    }

    list.add(const SizedBox(height: 16.0));

    return list;
  }

  void _submitSurvey(
    String path,
    String testName,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('questionnaires')
        .add({
      'createdAt': Timestamp.now(),
      'userId': user!.uid,
      'path': path,
      'questionnaire': testName,
      'answer': questionAnswer
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final path = routeArgs['path'] as String;
    final survey = routeArgs['survey'] as Survey;
    final num = routeArgs['num'] as int;

    return Scaffold(
      appBar: AppBar(title: Text(path)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Cuestionario $num',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                survey.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var e in survey.questions)
                      ...form(e, survey.options, questionAnswer),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          if (questionAnswer.containsValue("Respuesta")) {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                content: Text(
                                  "Por favor responda todas las preguntas"
                                ),
                              ));
                          } else if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text("Formulario enviado"),
                              ));
                            _submitSurvey(path, survey.testName);
                            Navigator.of(context).pop();
                          }
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
