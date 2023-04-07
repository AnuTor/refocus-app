import 'package:flutter/foundation.dart';
import './questions.dart';

class Survey with ChangeNotifier {
  final int id;
  final String title;
  final String? subtitle;
  final List<String> options;
  final bool done;
  final List<Question> questions;

  Survey(
      {required this.id,
      required this.title,
      this.subtitle,
      required this.options,
      this.done = false,
      required this.questions});
}
