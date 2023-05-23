import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../screens/survey_screen.dart';
import '../providers/survey.dart';

class SurveyElement extends StatefulWidget {
  final String path;
  final Survey survey;
  final int num;
  final bool enable;

  const SurveyElement({
    Key? key,
    required this.path,
    required this.survey,
    required this.num,
    this.enable = true,
  }) : super(key: key);

  @override
  State<SurveyElement> createState() => _SurveyElementState();
}

class _SurveyElementState extends State<SurveyElement> {
  Future<bool>? _isDoneFuture;

  @override
  void initState() {
    super.initState();
    if (!widget.survey.done && widget.enable) { //solo ejecuta checkDone() si no está hecha la encuesta y está habilitada
      _isDoneFuture = checkDone();
      _isDoneFuture!.then((isDone) {
        if (isDone) {
          setState(() {
            Provider.of<Survey>(context, listen: false).setDone();
          });
        }
      });
    }
  }

  Future<bool> checkDone() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User user = firebaseAuth.currentUser!;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('questionnaires')
      .where('userId', isEqualTo: user.uid)
      .where('path', isEqualTo: widget.path)
      .where('questionnaire', isEqualTo: widget.survey.testName)
      .limit(1)
      .get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.survey.done,
      child: ElevatedButton(
        onPressed: widget.enable
          ? () {
            Navigator.of(context).pushNamed(
              SurveyScreen.routeName,
              arguments: {
                'path': widget.path,
                'survey': widget.survey,
                'num': widget.num
              },
            );
          }
          : null,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          shape: const CircleBorder(),
          backgroundColor: (widget.enable && !widget.survey.done)
            ? Colors.deepOrange
            : Colors.lightGreenAccent[700],
        ),
        child: widget.enable
          ? (widget.survey.done
            ? const Icon(Icons.check)
            : Text(widget.num.toString()))
          : const Icon(Icons.lock),
      ),
    );
  }
}
