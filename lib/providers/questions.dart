import 'package:flutter/foundation.dart';

class Question with ChangeNotifier {
  final int id;
  final String question;

  Question({required this.id, required this.question});
}
