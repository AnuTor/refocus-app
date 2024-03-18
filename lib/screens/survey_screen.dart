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
  Map<String, int> questionAnswer = {};

  List<Widget> form(Question question, int lenght, List<String> options,
      Map<String, int> answer) {
    List<Widget> list = [];
    String questionNum;
    if (question.id < 10) {
      questionNum = 'Q0${question.id.toString()}';
    } else {
      questionNum = 'Q${question.id.toString()}';
    }
    answer[questionNum] ??= 0;
    list.add(Text('(${question.id}/$lenght) ${question.question}',
        style: const TextStyle(fontSize: 16)));
    for (int i = 0; i < options.length; i++) {
      list.add(RadioListTile(
        title: Text(options[i]),
        value: i + 1,
        groupValue: answer[questionNum],
        onChanged: (value) {
          setState(() {
            answer[questionNum] = value!;
          });
        },
      ));
    }
    list.add(const SizedBox(height: 16));
    return list;
  }

  void _submitSurvey(
    String path,
    String testName,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('questionnaires').add({
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
    final length = survey.questions.length;
    return Scaffold(
      appBar: AppBar(title: Text(path)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Cuestionario',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                survey.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var e in survey.questions)
                      ...form(e, length, survey.options, questionAnswer),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (questionAnswer.containsValue(0)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Por favor responda todas las preguntas"),
                            ));
                          } else if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Formulario enviado"),
                            ));
                            _submitSurvey(path, survey.testName);
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((_) {
                              Navigator.of(context).pop();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Enviar'),
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
