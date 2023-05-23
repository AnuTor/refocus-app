import 'package:flutter/foundation.dart';
import './questions.dart';

class Survey with ChangeNotifier {
  final int id;
  final String testName;
  final String title;
  final String? subtitle;
  final List<String> options;
  bool done;
  final List<Question> questions;

  Survey({
    required this.id,
    required this.testName,
    required this.title,
    this.subtitle,
    required this.options,
    this.done = false,
    required this.questions
  });

  void setDone() {
    done = true;
  }

  void clearDoneState() {
    done = false;
  }
}
