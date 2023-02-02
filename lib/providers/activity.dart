import 'package:flutter/foundation.dart';

class Activity with ChangeNotifier {
  final int id;
  final String title;
  final String text;

  Activity({
    required this.id,
    required this.title,
    required this.text,
  });
}
