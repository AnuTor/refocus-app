import 'package:flutter/material.dart';

import '../providers/questions.dart';
import '../providers/survey.dart';

class IntroSurveyScreen extends StatefulWidget {
  static const routeName = '/survey-screen';
  const IntroSurveyScreen({
    Key? key,
    required this.survey,
    required this.onAnswered,
  }) : super(key: key);

  final Survey survey;
  final void Function(String testName, Map<String, int> questionAnswer)
    onAnswered;

  @override
  State<IntroSurveyScreen> createState() => _IntroSurveyScreenState();
}

class _IntroSurveyScreenState extends State<IntroSurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, int> questionAnswer = {};

  List<Widget> form(Question question, List<String> options) {
    List<Widget> list = [];
    String questionNum;
    if (question.id < 10) {
      questionNum = 'Q0${question.id.toString()}';
    } else {
      questionNum = 'Q${question.id.toString()}';
    }
    questionAnswer[questionNum] ??= 0;
    list.add(Text(question.question,
        style: const TextStyle(fontSize: 21), textAlign: TextAlign.center));
    list.add(const SizedBox(height: 15));
    for (int i = 0; i < options.length; i++) {
      list.add(SizedBox(
        width: double.infinity,
        height: 65,
        child: TextButton(
          onPressed: () {
            setState(() {
              questionAnswer[questionNum] = i + 1;
            });
            if (!questionAnswer.containsValue(0)) {
              widget.onAnswered(widget.survey.testName, questionAnswer);
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Bordes rectos
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (questionAnswer[questionNum] == i + 1) {
                  return Colors.lightBlue;
                }
                return Colors.lightBlue[100]!;
              },
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero, 
            ),
          ),
          child: Center(
            child: Text(
              options[i],
              style: TextStyle(
                fontSize: 18,
                color: questionAnswer[questionNum] == i + 1
                  ? Colors.white
                  : Colors.blue,
              ),
            ),
          ),
        ),
      ), );
      list.add(const SizedBox(height: 10));
    }
    list.add(const SizedBox(height: 16));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final survey = widget.survey;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 25, right: 25),
              child: Column(
                children: [
                  Text(
                    survey.title,
                    style: const TextStyle(fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        for (var e in survey.questions)
                          ...form(e, survey.options),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 180),
        ],
      ),
    );
  }
}
